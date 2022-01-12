Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA56548CCCF
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 21:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357271AbiALUGe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 15:06:34 -0500
Received: from netrider.rowland.org ([192.131.102.5]:51667 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1357331AbiALUFh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 15:05:37 -0500
Received: (qmail 243238 invoked by uid 1000); 12 Jan 2022 15:05:35 -0500
Date:   Wed, 12 Jan 2022 15:05:35 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        linux-usb@vger.kernel.org, Roger Quadros <roger.quadros@nokia.com>
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <Yd80j0vjR0f9TCtN@rowland.harvard.edu>
References: <20220110062359.5314-2-quic_jackp@quicinc.com>
 <20220110063030.12957-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110063030.12957-1-quic_jackp@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 09, 2022 at 10:30:30PM -0800, Jack Pham wrote:
> From: Roger Quadros <roger.quadros@nokia.com>
> 
> Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> are encoded in MSBs of CDB byte 9.
> 
> This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> Mac OS X v10.6.3.
> 
> Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> ---
> v2: Removed Change-Id tag.
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 73 +++++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 73a28f8..1f7f4dd6 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -1188,6 +1188,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
>  	int		msf = common->cmnd[1] & 0x02;
>  	int		start_track = common->cmnd[6];
>  	u8		*buf = (u8 *)bh->buf;
> +	u8		format;
> +	int		i, len;
>  
>  	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
>  			start_track > 1) {
> @@ -1195,18 +1197,65 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
>  		return -EINVAL;
>  	}
>  
> -	memset(buf, 0, 20);
> -	buf[1] = (20-2);		/* TOC data length */
> -	buf[2] = 1;			/* First track number */
> -	buf[3] = 1;			/* Last track number */
> -	buf[5] = 0x16;			/* Data track, copying allowed */
> -	buf[6] = 0x01;			/* Only track is number 1 */
> -	store_cdrom_address(&buf[8], msf, 0);
> +	format = common->cmnd[2] & 0xf;

Hmmm.  According to this part later on:

> @@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
>  		common->data_size_from_cmnd =
>  			get_unaligned_be16(&common->cmnd[7]);
>  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> -				      (7<<6) | (1<<1), 1,
> +				      (0xf<<6) | (1<<1), 1,
>  				      "READ TOC");

common->cmnd[2] can never be anything other than 0.  So this computation 
and the test immediately below are pointless -- unless you change the 
argument to check_command().

Alan Stern

> +	/*
> +	 * Check if CDB is old style SFF-8020i
> +	 * i.e. format is in 2 MSBs of byte 9
> +	 * Mac OS-X host sends us this.
> +	 */
> +	if (format == 0)
> +		format = (common->cmnd[9] >> 6) & 0x3;
> +
> +	switch (format) {
> +	case 0:
> +		/* Formatted TOC */
> +		len = 4 + 2*8;		/* 4 byte header + 2 descriptors */
> +		memset(buf, 0, len);
> +		len -= 2;		/* TOC Length excludes length field */
> +		buf[1] = len;		/* TOC data length */
> +		buf[2] = 1;		/* First track number */
> +		buf[3] = 1;		/* Last track number */
> +		buf[5] = 0x16;		/* Data track, copying allowed */
> +		buf[6] = 0x01;		/* Only track is number 1 */
> +		store_cdrom_address(&buf[8], msf, 0);
> +
> +		buf[13] = 0x16;		/* Lead-out track is data */
> +		buf[14] = 0xAA;		/* Lead-out track number */
> +		store_cdrom_address(&buf[16], msf, curlun->num_sectors);
> +		return len;
> +
> +	case 2:
> +		/* Raw TOC */
> +		len = 4 + 3*11;		/* 4 byte header + 3 descriptors */
> +		memset(buf, 0, len);	/* Header + A0, A1 & A2 descriptors */
> +		len -= 2;		/* TOC Length excludes length field */
> +		buf[1] = len;		/* TOC data length */
> +		buf[2] = 1;		/* First complete session */
> +		buf[3] = 1;		/* Last complete session */
> +
> +		buf += 4;
> +		/* fill in A0, A1 and A2 points */
> +		for (i = 0; i < 3; i++) {
> +			buf[0] = 1;	/* Session number */
> +			buf[1] = 0x16;	/* Data track, copying allowed */
> +			/* 2 - Track number 0 ->  TOC */
> +			buf[3] = 0xA0 + i; /* A0, A1, A2 point */
> +			/* 4, 5, 6 - Min, sec, frame is zero */
> +			buf[8] = 1;	/* Pmin: last track number */
> +			buf += 11;	/* go to next track descriptor */
> +		}
> +		buf -= 11;		/* go back to A2 descriptor */
> +
> +		/* For A2, 7, 8, 9, 10 - zero, Pmin, Psec, Pframe of Lead out */
> +		store_cdrom_address(&buf[7], msf, curlun->num_sectors);
>  
> -	buf[13] = 0x16;			/* Lead-out track is data */
> -	buf[14] = 0xAA;			/* Lead-out track number */
> -	store_cdrom_address(&buf[16], msf, curlun->num_sectors);
> -	return 20;
> +		return len;
> +
> +	default:
> +		/* Multi-session, PMA, ATIP, CD-TEXT not supported/required */
> +		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
> +		return -EINVAL;
> +	}
>  }
>  
>  static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
> @@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
>  		common->data_size_from_cmnd =
>  			get_unaligned_be16(&common->cmnd[7]);
>  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> -				      (7<<6) | (1<<1), 1,
> +				      (0xf<<6) | (1<<1), 1,
>  				      "READ TOC");
>  		if (reply == 0)
>  			reply = do_read_toc(common, bh);
> -- 
> 2.7.4
> 
