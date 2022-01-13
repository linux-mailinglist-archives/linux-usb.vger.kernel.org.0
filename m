Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0FA48D1D7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 06:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiAMFW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 00:22:57 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27768 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiAMFW5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 00:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642051377; x=1673587377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pmvnzf4Tl9aMMBrrCo5CMXd3IlmA2831nzVh88c0cr4=;
  b=ihay5kQNnp/3ZNmL2Flyv4RgyPgZfMtB09UsjjNmxbPYtPoJoH0JfUY2
   1eN05nSrgB/ckodi3f7TRHe/k2MepsyvXUDc2DcqfqMWhaf90g1P98qdu
   6n22r0d+m8nlFd1vL/r3EF1YEyyXXM/vYEwUrg0ocvCqgelPa+Pn40xQG
   A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 12 Jan 2022 21:22:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 21:22:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 21:22:55 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 12 Jan 2022 21:22:55 -0800
Date:   Wed, 12 Jan 2022 21:22:53 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        <linux-usb@vger.kernel.org>,
        "Roger Quadros" <roger.quadros@nokia.com>
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <20220113052253.GF3221@jackp-linux.qualcomm.com>
References: <20220110062359.5314-2-quic_jackp@quicinc.com>
 <20220110063030.12957-1-quic_jackp@quicinc.com>
 <Yd80j0vjR0f9TCtN@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yd80j0vjR0f9TCtN@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Wed, Jan 12, 2022 at 03:05:35PM -0500, Alan Stern wrote:
> On Sun, Jan 09, 2022 at 10:30:30PM -0800, Jack Pham wrote:
> > From: Roger Quadros <roger.quadros@nokia.com>
> > 
> > Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> > sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> > are encoded in MSBs of CDB byte 9.
> > 
> > This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> > Mac OS X v10.6.3.
> > 
> > Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > ---
> > v2: Removed Change-Id tag.
> > 
> >  drivers/usb/gadget/function/f_mass_storage.c | 73 +++++++++++++++++++++++-----
> >  1 file changed, 61 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> > index 73a28f8..1f7f4dd6 100644
> > --- a/drivers/usb/gadget/function/f_mass_storage.c
> > +++ b/drivers/usb/gadget/function/f_mass_storage.c
> > @@ -1188,6 +1188,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
> >  	int		msf = common->cmnd[1] & 0x02;
> >  	int		start_track = common->cmnd[6];
> >  	u8		*buf = (u8 *)bh->buf;
> > +	u8		format;
> > +	int		i, len;
> >  
> >  	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
> >  			start_track > 1) {
> > @@ -1195,18 +1197,65 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
> >  		return -EINVAL;
> >  	}
> >  
> > -	memset(buf, 0, 20);
> > -	buf[1] = (20-2);		/* TOC data length */
> > -	buf[2] = 1;			/* First track number */
> > -	buf[3] = 1;			/* Last track number */
> > -	buf[5] = 0x16;			/* Data track, copying allowed */
> > -	buf[6] = 0x01;			/* Only track is number 1 */
> > -	store_cdrom_address(&buf[8], msf, 0);
> > +	format = common->cmnd[2] & 0xf;
> 
> Hmmm.  According to this part later on:
> 
> > @@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
> >  		common->data_size_from_cmnd =
> >  			get_unaligned_be16(&common->cmnd[7]);
> >  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> > -				      (7<<6) | (1<<1), 1,
> > +				      (0xf<<6) | (1<<1), 1,
> >  				      "READ TOC");
> 
> common->cmnd[2] can never be anything other than 0.

Ah, that is true.  So to allow for cmnd[2] (as well as cmnd[9] as
intended by the patch) to be non-zero, the "mask" argument should rather
be:

 (0xf<<6) | (3<<1)

In other words a bitmask of 0x3c6, corresponding to command data bytes
1, 2, 6, 7, 8 and 9.  Is my understanding correct?

> So this computation and the test immediately below are pointless --
> unless you change the argument to check_command().

If you are referring to the "if (format == 0)" check, then I believe you
are right.

> > +	/*
> > +	 * Check if CDB is old style SFF-8020i
> > +	 * i.e. format is in 2 MSBs of byte 9
> > +	 * Mac OS-X host sends us this.
> > +	 */
> > +	if (format == 0)
> > +		format = (common->cmnd[9] >> 6) & 0x3;

It seems this is the gist of the patch.  Without changing the mask
parameter to check_command() above, we know we can only reach here if
format = common->cmnd[2] is 0.  However this snippet is then reassigning
format from the upper bits of the 9th byte which could be non-zero, at
least in the case of MacOS.

So this patch does seem a bit incomplete as you point out and maybe
updating the mask as above should help to allow both fields to determine
the format for any non-zero TOC type.

But I was trying to confirm these details from the SFF-8020i spec as
mentioned in the original comment above.  I was only able to find a
draft copy [1] from a web search which stated:

	"Format field definition: When Format in Byte 2 is zero, then
	Byte 9 is used. Other values for this field are reserved for
	definition in MMC."

	Note: The Format field in Byte 9 is a vendor-specific area and
	will be removed in subsequent versions of this specification.
	Functionality is moving to Byte 2."

However when trying to look up the latest official release of SFF-8020
the SNIA website [2] lists it as having been expired and incorporated
into the SCSI MMC specification.  Consequently, I haven't yet been able
to look further into the SCSI MMC spec itself as it seems it is only
available for a fee from the ANSI/INCITS website [3].  I'm hoping you or
maybe somebody on this list might have more knowledge on these details.

So I'm left wondering whether the Format field in Byte 9 is even
standardized, or if it is a remnant of an older or possibly
draft/non-final specification.  Yet we clearly have a host that is
relying on this behavior, so there is utility in this patch.

FWIW, here are the raw bytes of the READ TOC request transaction as
issued by the MacOS host, obtained from a bus analyzer trace, which this
patch is purportedly fixing:

 55 53 42 43 19 00 00 00 FE FF 00 00 80 00 0A 43
                                              ^^
                                              cmnd[0] i.e. OpCode
 02 00 00 00 00 00 FF FE 80 00 00 00 00 00 00
    ^^                   ^^
    cmnd[2]==0           ||
                         cmnd[9], upper 2 bits == 0x2

Thanks,
Jack

[1] https://www.bswd.com/sff8020i.pdf
[2] https://www.snia.org/technology-communities/sff/specifications
[3] https://webstore.ansi.org/standards/incits/ansiincits4302007

> > +
> > +	switch (format) {
> > +	case 0:
> > +		/* Formatted TOC */
> > +		len = 4 + 2*8;		/* 4 byte header + 2 descriptors */
> > +		memset(buf, 0, len);
> > +		len -= 2;		/* TOC Length excludes length field */
> > +		buf[1] = len;		/* TOC data length */
> > +		buf[2] = 1;		/* First track number */
> > +		buf[3] = 1;		/* Last track number */
> > +		buf[5] = 0x16;		/* Data track, copying allowed */
> > +		buf[6] = 0x01;		/* Only track is number 1 */
> > +		store_cdrom_address(&buf[8], msf, 0);
> > +
> > +		buf[13] = 0x16;		/* Lead-out track is data */
> > +		buf[14] = 0xAA;		/* Lead-out track number */
> > +		store_cdrom_address(&buf[16], msf, curlun->num_sectors);
> > +		return len;
> > +
> > +	case 2:
> > +		/* Raw TOC */
> > +		len = 4 + 3*11;		/* 4 byte header + 3 descriptors */
> > +		memset(buf, 0, len);	/* Header + A0, A1 & A2 descriptors */
> > +		len -= 2;		/* TOC Length excludes length field */
> > +		buf[1] = len;		/* TOC data length */
> > +		buf[2] = 1;		/* First complete session */
> > +		buf[3] = 1;		/* Last complete session */
> > +
> > +		buf += 4;
> > +		/* fill in A0, A1 and A2 points */
> > +		for (i = 0; i < 3; i++) {
> > +			buf[0] = 1;	/* Session number */
> > +			buf[1] = 0x16;	/* Data track, copying allowed */
> > +			/* 2 - Track number 0 ->  TOC */
> > +			buf[3] = 0xA0 + i; /* A0, A1, A2 point */
> > +			/* 4, 5, 6 - Min, sec, frame is zero */
> > +			buf[8] = 1;	/* Pmin: last track number */
> > +			buf += 11;	/* go to next track descriptor */
> > +		}
> > +		buf -= 11;		/* go back to A2 descriptor */
> > +
> > +		/* For A2, 7, 8, 9, 10 - zero, Pmin, Psec, Pframe of Lead out */
> > +		store_cdrom_address(&buf[7], msf, curlun->num_sectors);
> >  
> > -	buf[13] = 0x16;			/* Lead-out track is data */
> > -	buf[14] = 0xAA;			/* Lead-out track number */
> > -	store_cdrom_address(&buf[16], msf, curlun->num_sectors);
> > -	return 20;
> > +		return len;
> > +
> > +	default:
> > +		/* Multi-session, PMA, ATIP, CD-TEXT not supported/required */
> > +		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
> > +		return -EINVAL;
> > +	}
> >  }
> >  
> >  static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
> > @@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
> >  		common->data_size_from_cmnd =
> >  			get_unaligned_be16(&common->cmnd[7]);
> >  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> > -				      (7<<6) | (1<<1), 1,
> > +				      (0xf<<6) | (1<<1), 1,
> >  				      "READ TOC");
> >  		if (reply == 0)
> >  			reply = do_read_toc(common, bh);
> > -- 
> > 2.7.4
> > 
