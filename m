Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1E03A68B2
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 16:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhFNOIj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 10:08:39 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50437 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234235AbhFNOIj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 10:08:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id D033F580B07;
        Mon, 14 Jun 2021 10:06:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 14 Jun 2021 10:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=liKeoJ3++Py15OkYaEK8u1d9a18
        jSrl+1rutSitPmxU=; b=mk2+qLXelYuK85U6hzJHcesmhuCd/1DQYR4Zx6Xx34f
        13soCjwxzwB0G8NUUvzM/DNrOrZ+lWIG2me0Ygz1JoonYEfVzbb+pxZMy/a2IWrj
        PV/qp8jll81uJuvP9bjmgbbCcNG3BP17b9pc4akgXTHKSrBHv2WT/v3csadUguYG
        wQsELn2hD8afjqa/RsrWNqE3MpVeyG3f5uBO58gRsK/iAZo3X78Y7BTuMJgeeXfs
        +Vi4JPnR+9baKC/0OyiWrFWrJH27kFjfIu6mVzGWpNyGIgy94UwsIwvX0Wgdz75W
        enJqworrmB5GMfUyJwVCujjgMfIZ5TRYM7qetWHF6Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=liKeoJ
        3++Py15OkYaEK8u1d9a18jSrl+1rutSitPmxU=; b=RzZlhF63wLd+u2/tLqzPqp
        0CJEC6OrOHXA5qCemWHSbEvZ56+7b+PGGORqaXPWBR0R4r+GHlpho+8MAqzmpbGH
        fcjtJPojuOOOSQh1fbNN5w3PTG1s9oq+TqRE4/0D4WQ+lvyrFn49OwDt/EyIRjYW
        VMPBf8NeqQ3gavCVAUAsjZxyJjaD9vc4i2/NMMAXO4dFD6JGHVO9fMZcxfETkV6t
        0QVMo1gaM70psScNaihYDStGRmphALmWPc4LW8wDdsXHIX4CzYDdjXd5MVG2SuH7
        Uw/YqkV6s/gS7v97O1wgZYGwDcpigkcG5oC9phUKoGNAgcjtFmLB6iyqH3kVXBaw
        ==
X-ME-Sender: <xms:amLHYGJWoy-1piv-zhakc1t72F3qejqvWx1t53_50PMxJjDnKmetrg>
    <xme:amLHYOLvde6dRJBrxqP8xxEKgm9a5mMWXbppjx3ykaw8KVxbl8yQwDc76XAgtQFPu
    aC8cRtwN1jRsA>
X-ME-Received: <xmr:amLHYGuHdJWE6C8kZPS-ZPqqDs_2KZx927D_l24dXnxON3Zw9Ez40qKd7DjBv2nTeA-CfnLcanHVMhnSNxgRNoTpGnhV6tS7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:amLHYLY2zzlgRgYrxam6vdrqfyfoyjFAnYC8isdlQIwIiBCxhPhXlA>
    <xmx:amLHYNaTbUjZT1eTMnZXUq9sI9In48Xyi_hh3SP2Xe-dhs3GBIFBrw>
    <xmx:amLHYHDSqKcElxMAZnKnB3ngK8fyFbs89254B_pdFv7oiccHJ9RCJg>
    <xmx:a2LHYBQFfbCTnxuT-yZBOnpbpkqu9keYIwPVRnc2rhsVqhn2Hth0Cg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 10:06:33 -0400 (EDT)
Date:   Mon, 14 Jun 2021 16:06:30 +0200
From:   Greg KH <greg@kroah.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Fix DROM handling for USB4 DROM
Message-ID: <YMdiZnPKqjyK6FQ5@kroah.com>
References: <20210614135210.29787-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614135210.29787-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 14, 2021 at 04:52:10PM +0300, Gil Fine wrote:
> DROM for USB4 host/device has a shorter header than Thunderbolt DROM
> header. This patch addresses host/device with USB4 DROM (According to spec:
> Universal Serial Bus 4 (USB4) Device ROM Specification, Rev 1.0, Feb-2021).
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/eeprom.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 46d0906a3070..f9d26bd4f486 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -214,7 +214,10 @@ static u32 tb_crc32(void *data, size_t len)
>  	return ~__crc32c_le(~0, data, len);
>  }
>  
> -#define TB_DROM_DATA_START 13
> +#define TB_DROM_DATA_START		13
> +#define TB_DROM_HEADER_LENGTH		22
> +/* BYTES 16-21 - nonexistent in USB4 DROM */
> +#define TB_DROM_USB4_HEADER_LENGTH	16
>  struct tb_drom_header {
>  	/* BYTE 0 */
>  	u8 uid_crc8; /* checksum for uid */
> @@ -224,9 +227,9 @@ struct tb_drom_header {
>  	u32 data_crc32; /* checksum for data_len bytes starting at byte 13 */
>  	/* BYTE 13 */
>  	u8 device_rom_revision; /* should be <= 1 */
> -	u16 data_len:10;
> -	u8 __unknown1:6;
> -	/* BYTES 16-21 */
> +	u16 data_len:12;
> +	u8 reserved:4;
> +	/* BYTES 16-21 - Only for TBT DROM, nonexistent in USB4 DROM */

What is the odds the above does not work properly for big endian
systems?

And why put the comment after the area and not before?

thanks,

greg k-h
