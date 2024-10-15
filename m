Return-Path: <linux-usb+bounces-16222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1199E445
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 12:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A5B1C21D6B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 10:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA9F1E3DF1;
	Tue, 15 Oct 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JOL78Nqm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WyQk1LUc"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE204683
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988818; cv=none; b=Dq0XRn75pn717ajeqqjFmH2tlX8RVIcPG7WDoZa7dPYQGkTumLLBuuXKde823K3dBJ6r1OWrp2Xz3lQ/qBEfexRLzZcp4VjgOpUULq50LQ69hhaCMHE3aVb1GvXAcwljFLMquSCF9qaCyzYSjQBBJ+HSGZdSjwvfrO8lKrEqiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988818; c=relaxed/simple;
	bh=Ddj2c5QXGRdlY8uGGY3btAqxsTN7yzrqmcbdcfOsVs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUiQB/IpESiyWCXF62SuvvUn76uzlbdNUq3BPKk6zkYGuH4+VUk3vtNgkHKDkEU2+cC4V8CpwGklHKGySEcNaIWPvzJK+CkFJjPBAqil+WaoWVj1FnqPwclPwHZtogHgQcjtW7KjQY+vfKFlLNS+wFJjIj56S3lpMr6H0cJXIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JOL78Nqm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WyQk1LUc; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68A50114021B;
	Tue, 15 Oct 2024 06:40:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 15 Oct 2024 06:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728988814; x=1729075214; bh=bnAowNCVBR
	JBB+REKjTOj602NDFMZ4d5K6FgNsCgwdU=; b=JOL78NqmXsF/iBrfKjmjVoyQMg
	VtT1N9Z1Un+tBSoo6/A3q7im1Tybp9qmAspiPMQjkibTsNOg9F1o5Hd1ApVp8S8C
	fEzhl3IIiLSi0KV8mvgLeuXv3rsWlyjFa5BLVn3RemUam5EtwG1ef20GuQ8Su8fS
	XlF0FV/4O4EI8+Ymv1HQ5Q83+96EWXJBvX6b8stYYahB89w/vNsv92oIYvrYpgq4
	73xN+t3fwVQ91RiCHdTxuu7ui49j8SuzmRvDOgEPHmYIDw5L6VTJzfsc7C1x+oIW
	F6Us9RXOvylKRRPv+697MUc8F2ltZ9TgSIdEaE/zfBRkZw+QlscXfRpiYcfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728988814; x=1729075214; bh=bnAowNCVBRJBB+REKjTOj602NDFM
	Z4d5K6FgNsCgwdU=; b=WyQk1LUcAt9jrgHE/q4uSijpA4eftBrvQ+Bce1sv3x6C
	NT8wwsBU3N5gFU91dwDirvaAifkLS2hssMbAvsCHTnPntbbvo80gc7lZVvxhfVJf
	MwqO86szbNVqdDl1gsfegMGBNScMJzGJpfZPBzEP3PzoOdzJLyYxUiAcze+jfcp6
	CY5dAvgIPhC5oY/1bHuwTFH9VHCnHIwSAaLj2jhi7mNJl2JdPnSLPB/D/acpIdPY
	VApcBsfb9BWMChJ+ouJCWCVfVu7g43znJli6eUcKnLx4yfzqeaY2HWIE2vFBnJXH
	oVFwEI0W76ShKt8iDt9Zm7iurfILVezSnvINXNOIZQ==
X-ME-Sender: <xms:jkYOZ9n81AJKo1dPql0kEC-KGxM-f6kIn2NQ0VyweZ7809ofF1sX5A>
    <xme:jkYOZ4263B3cRlcM-UhOXszBlCKgJ7d1I7OdF9t07SD2NfN2aEiKVstUguhfiq0Os
    pgSDLLsI56gQg>
X-ME-Received: <xmr:jkYOZzp08j1GkT0YqcG4JohKFfzcJM4Xd01HUaXl7ksRzYVPVaS7v6NvxQszk8kKKTgLGRLpdxKFvNdfqHqz5uOX9qJhoJob1HwImw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehmihgthhgrlhdrphgvtghiohesghhmrghilhdrtghomh
    dprhgtphhtthhopehmrghthhhirghsrdhnhihmrghnsehinhhtvghlrdgtohhmpdhrtghp
    thhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jkYOZ9kEA-vaBjXjE6CM5sXy5U6TzZvsegJ-4InMN1OTqGxmCaXM-g>
    <xmx:jkYOZ73K86hsL3pQBwVNThm0NLPJEomAarVcdNVal21HsO9xcve5YQ>
    <xmx:jkYOZ8u8FUVI30PIke9SQDdk25d9-OTVIQD-cHeGEkwNw3W_zc-zuA>
    <xmx:jkYOZ_VVoXlJZAOLSz96YhOiBZpyNMDFIaoejc2Zeda4u1v9D1ctyQ>
    <xmx:jkYOZ1pKz_8WLdWgPOoqz0r7vjOos3VB4yKB7K2IAluZ_Xf9NuIhh-3X>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Oct 2024 06:40:13 -0400 (EDT)
Date: Tue, 15 Oct 2024 12:40:11 +0200
From: Greg KH <greg@kroah.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: xhci: Warn about suspected "start-stop" bugs in
 HCs
Message-ID: <2024101534-roundup-promotion-eb13@gregkh>
References: <20241014210840.5941d336@foxbook>
 <20241014211122.7cb5b133@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014211122.7cb5b133@foxbook>

On Mon, Oct 14, 2024 at 09:11:22PM +0200, Michal Pecio wrote:
> NEC controllers have a bug, where stopping an endpoint soon after it
> has been restarted doesn't quite work as expected. This forces us to
> track whether each Stop Endpoint command is expected to fail or not.
> 
> Reuse this infrastracture to warn about similar bugs on other chips,
> if any are found.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>  drivers/usb/host/xhci-ring.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index c0efb4d34ab9..c326b86d713c 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1186,8 +1186,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
>  			 * So keep retrying until the command clearly succeeds.
>  			 * Not clear what to do if other HCs have similar bugs.
>  			 */
> -			if (!(xhci->quirks & XHCI_NEC_HOST))
> +			if (!(xhci->quirks & XHCI_NEC_HOST)) {
> +				xhci_warn(xhci, "Unhandled Stop Endpoint failure on slot %d ep_index %d\n",
> +						slot_id, ep_index);

If a user sees this, what are they supposed to do?  This is a hardware
bug, but with this we are going to get reports of "something broke in
the kernel", right?  Why not make it just more informative, like:
	xhci_info(xhci, "hardware can not deal with...

or something like that so that people know we know about the bug, and
are working around it, but that it's not our issue, but rather the
hardware that is at fault?

thanks,

greg k-h

