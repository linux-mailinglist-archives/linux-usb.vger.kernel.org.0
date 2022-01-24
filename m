Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01584983FD
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 17:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbiAXQAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 11:00:47 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:30475 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236081AbiAXQAr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 11:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643040047; x=1674576047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGNUj1fGb8AtoISaZvkK0Q9r1wQTveFZQ2ej5peiWrk=;
  b=l9NpEuFCc6Ms5aQ53oWI5eeZ/dwPiLOxuS0QoYsZ4i5GGQeDM608+wkR
   3cEzLDTbs6Z8nGTufIbwgieoQ7pZBhDDyMKXMh1l1EU3+ZZdEP6PivG35
   4ReeJD0o/dYbu1KTtMrailbERTaGpzasTuxuaXamr6iTQanRjSWyppiL5
   Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jan 2022 08:00:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:00:46 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 08:00:46 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 24 Jan 2022 08:00:45 -0800
Date:   Mon, 24 Jan 2022 08:00:40 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Nazarewicz <mina86@mina86.com>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <20220124160027.GG3221@jackp-linux.qualcomm.com>
References: <20220113175916.10090-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220113175916.10090-1-quic_jackp@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 13, 2022 at 09:59:16AM -0800, Jack Pham wrote:
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
> v3: Updated command mask to allow for non-zero byte 2
> v2: Removed Change-Id
> v1: Resurrected original change [1] and consolidated into single patch
> 
> [1] https://lore.kernel.org/lkml/1302015569-9668-1-git-send-email-roger.quadros@nokia.com/T/#u
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 73 ++++++++++++++++----
>  1 file changed, 61 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 752439690fda..d08463756eb0 100644
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

Length is now decremented to 18...

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

... which is returned here.  This should be returning 20, not 18.
Indeed it's the same mistake as was pointed out in the original patch
series https://lore.kernel.org/lkml/4D876ECA.4010503@nokia.com/ so I
must have inadvertently applied the wrong version of the patch.

> +
> +	case 2:
> +		/* Raw TOC */
> +		len = 4 + 3*11;		/* 4 byte header + 3 descriptors */
> +		memset(buf, 0, len);	/* Header + A0, A1 & A2 descriptors */
> +		len -= 2;		/* TOC Length excludes length field */

Same here.

Will send out v4 with this corrected.
