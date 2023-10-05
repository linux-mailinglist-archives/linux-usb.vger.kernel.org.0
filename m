Return-Path: <linux-usb+bounces-1142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99E7B9E6D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 16:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id DD5321C2098F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 14:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD327ED2;
	Thu,  5 Oct 2023 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="6zqsob4W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ot8Hp2ir"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1427725
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:05:09 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB794F6F0
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:02:52 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id B553C5C0398;
	Thu,  5 Oct 2023 03:20:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 05 Oct 2023 03:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696490413; x=1696576813; bh=uf
	aGcSs5vDPG+rSC5/4FkEENRtFqKyrJ/T6RM1RwL3U=; b=6zqsob4WBSij7QjbWc
	8sWNjiNy0ocF3DS7Z7QXvQcc2htBW1hM1gm05bistcgBtAB4fqQN+pw9M3nRCFhk
	O19vXFvoCzEDcwnLQkAYJaiwxHh2vJ/C8YzNwFhaYDH2SoTkL+lf7wP8ZE8iyiYT
	HpMrpmBybjlU5dOXJO/YCs0uKabBrxiQZli065dMwG3MdKKyCucbEuQS6ON7+g0/
	vwr03QS5ZfqZfr+kW5avhuJPhOtC0UV1zZunBrAcx4Hs6GPxEwqBD1XbAQQkUgwc
	eULz4qdUV0dk8OQxxVdxsMP+nzhcbmuqDQ3zVMthgeIw786PwL5Gr+JTEUoCWar+
	4zVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696490413; x=1696576813; bh=ufaGcSs5vDPG+
	rSC5/4FkEENRtFqKyrJ/T6RM1RwL3U=; b=Ot8Hp2irKnsenXfUm2jLUaGUFertV
	TZYrjloDb3YPZtClCRZzhyWJUvMu2+HoJ5x7owzNT3W0pF/N05PPAOtLCrWJEBhS
	KyPBti4P+xb0RPWmKBXqwQ3jpFelqTmewotNxZUniR6w99wd4PwbgLnKcFY6ZlEm
	Mbqw2Jst1NxzQMlgG6Becw2mxXaJ6Gvx8CNty1bbX9kwIM7ji/e4clWQZAlZeH1z
	5OM1HTwXkG0AnfCjGXYxIL2ZTyFVJwSmbYGuUhzXVE0N1HP4ZITpo09iaYtR8EEy
	WwRefQiXRiK+G2NDWCz0gkj7/cloziwqaodmCHqOCzG2WwcUuAC6RWUgg==
X-ME-Sender: <xms:rWMeZSkFF7A-O4p2fw8CU0O_btQHEy-8U2j9yviBvKTaxbjrp7E1zA>
    <xme:rWMeZZ0kMkAsBMc3fAww_exYAchCcTQhABN9yZ-QsMuzk_k0QL1UOAV9imP8ZUHZB
    tWrv9YEawiABQ>
X-ME-Received: <xmr:rWMeZQr9WkA3zvSrvOKNtnSmRB6OE1oSGAGhObGsevU1PtsxQKSImzEUPGYQnq_YD1P_3KRUPUVCWUQe5bojUZxaLxzMmF08cfoqnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeefgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:rWMeZWklMFxfDwVMkh18ymIFK8_dXMhHZueW9ISJfXZ3GaIvgAcWbg>
    <xmx:rWMeZQ0ILElfdRvJAUIBqMO-IWSzI0eSiv_SXsZfyaKPDXilZR8QIA>
    <xmx:rWMeZdu33el89dws-Vpe5IW9XI2RxXzaeaSSjtl_j8GiIWJvWLmbTw>
    <xmx:rWMeZaoG5EVUL6uDrKUXdakEcupDMkPO5FQyZBPWuJ-s88IxNKiIDQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 03:20:12 -0400 (EDT)
Date: Thu, 5 Oct 2023 09:20:10 +0200
From: Greg KH <greg@kroah.com>
To: linux-dev@sensoray.com
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, dean@sensoray.com
Subject: Re: [PATCH] usb/gadget: function fs req_match endpoint address fix
Message-ID: <2023100506-veteran-foil-cec0@gregkh>
References: <20231003221103.1607964-1-linux-dev@sensoray.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003221103.1607964-1-linux-dev@sensoray.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 03:11:03PM -0700, linux-dev@sensoray.com wrote:
> From: Dean Anderson <linux-dev@sensoray.com>
> 
> Fixes f_fs.c handling USB_RECIP_ENDPOINT request types incorrectly for
> endpoints not belonging to it. f_fs.c needs to distinguish between IN
> and OUT endpoints, not just the endpoint number. Otherwise, f_fs may
> handle endpoints belonging to other functions. This occurs in the
> gadget/composite.c composite_setup function in the req_match callback.
> 
> Signed-off-by: Dean Anderson <linux-dev@sensoray.com>

What commit id does this fix?

> ---
>  drivers/usb/gadget/function/f_fs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index c727cb5de871..fb95ca4aa025 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -71,7 +71,7 @@ struct ffs_function {
>  	struct ffs_data			*ffs;
>  
>  	struct ffs_ep			*eps;
> -	u8				eps_revmap[16];
> +	u8				eps_revmap[32]; /* 16 in endpoints, 16 out endpoints*/

Can't this be two separate arrays so you don't have to do fun masks to
pick out which is an in and which is an out?

>  	short				*interfaces_nums;
>  
>  	struct usb_function		function;
> @@ -2847,6 +2847,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
>  		struct usb_ep *ep;
>  		u8 bEndpointAddress;
>  		u16 wMaxPacketSize;
> +		u8 addr;
>  
>  		/*
>  		 * We back up bEndpointAddress because autoconfig overwrites
> @@ -2870,8 +2871,9 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
>  
>  		ffs_ep->ep  = ep;
>  		ffs_ep->req = req;
> -		func->eps_revmap[ds->bEndpointAddress &
> -				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
> +		addr = ((ds->bEndpointAddress & USB_ENDPOINT_DIR_MASK) >> 3)
> +			| (ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
> +		func->eps_revmap[addr] = idx + 1;
>  		/*
>  		 * If we use virtual address mapping, we restore
>  		 * original bEndpointAddress value.
> @@ -3403,7 +3405,9 @@ static void ffs_func_resume(struct usb_function *f)
>  
>  static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
>  {
> -	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
> +	u8 addr = ((num & USB_ENDPOINT_DIR_MASK) >> 3)
> +		| (num & USB_ENDPOINT_NUMBER_MASK);
> +	num = func->eps_revmap[addr];

That's messy, again, 2 arrays would make this much simpler I think?

thanks,

greg k-h

