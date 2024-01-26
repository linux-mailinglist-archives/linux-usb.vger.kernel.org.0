Return-Path: <linux-usb+bounces-5548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88DC83E34C
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 21:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A305B22F39
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534E822EFC;
	Fri, 26 Jan 2024 20:23:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FE22EF4
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300582; cv=none; b=kZ2eXF5ckaAITB88AMITrPDeJTDbFBAbwGw5tBXo5roNFLTbGbCltOuLIRy3zN1PWmLpYgKd+RM1xgmmE4mQdpIBLIse9VnOG9rOQKEyNGcwB+Y+oDpLON2KVen2Uil2TTw86MyUnjnZ8mmHBbWU0DQs2LlCdF88JqSzHmVtcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300582; c=relaxed/simple;
	bh=+fZ+k7qbAjPWqQ9kl+L37M52c8/+JfCn6T9BzKS9zlg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=IpDGRAFT5VqU0JXANN0ETHg2IFNFjgQDaz4TxhSovgGRY1Y6Iy/y9OnWwsnM+Nix9rN8mubkh8VOpkDOp0Sf5j/lxYNL+tEnUNbS9g+02M+rgAHVztuneIBpMSxehShV9POegNv1HJiXKUuY8+QMV6UHf843pB+MtYaXox3o3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D5A5FF802;
	Fri, 26 Jan 2024 20:22:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1rTSj0-00AOTG-23;
	Fri, 26 Jan 2024 21:22:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-usb@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v3] usb: gadget: f_fs: expose ready state in configfs
References: <20240118144808.4010679-1-peter@korsgaard.com>
	<fc910229-81f6-48eb-acc9-f4899ccecc5d@collabora.com>
Date: Fri, 26 Jan 2024 21:22:54 +0100
In-Reply-To: <fc910229-81f6-48eb-acc9-f4899ccecc5d@collabora.com> (Andrzej
	Pietrasiewicz's message of "Fri, 26 Jan 2024 21:01:53 +0100")
Message-ID: <878r4b3kv5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: peter@korsgaard.com

>>>>> "Andrzej" =3D=3D Andrzej Pietrasiewicz <andrzej.p@collabora.com> writ=
es:

 > Hi Peter,
 > W dniu 18.01.2024 o=C2=A015:48, Peter Korsgaard pisze:
 >> When a USB gadget is configured through configfs with 1 or more f_fs
 >> functions, then the logic setting up the gadget configuration has to wa=
it
 >> until the user space code (typically separate applications) responsible=
 for
 >> those functions have written their descriptors before the gadget can be
 >> activated.
 >> The f_fs instance already knows if this has been done, so expose it
 >> through
 >> a "ready" attribute in configfs for easier synchronization.
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> Changes since v2:
 >> - Add ABI documentation as requested by Greg
 >> Changes since v1:
 >> - Add documentation snippet as requested by Greg.
 >> Documentation/ABI/testing/configfs-usb-gadget-ffs | 12
 >> ++++++++++--
 >> Documentation/usb/gadget-testing.rst              |  8 ++++++++
 >> drivers/usb/gadget/function/f_fs.c                | 15 +++++++++++++++
 >> 3 files changed, 33 insertions(+), 2 deletions(-)
 >> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ffs
 >> b/Documentation/ABI/testing/configfs-usb-gadget-ffs
 >> index e39b27653c65..bf8936ff6d38 100644
 >> --- a/Documentation/ABI/testing/configfs-usb-gadget-ffs
 >> +++ b/Documentation/ABI/testing/configfs-usb-gadget-ffs
 >> @@ -4,6 +4,14 @@ KernelVersion:	3.13
 >> Description:	The purpose of this directory is to create and remove it.
 >> A corresponding USB function instance is
 >> created/removed.
 >> -		There are no attributes here.
 >> -		All parameters are set through FunctionFS.
 >> +		All attributes are read only:
 >> +
 >> +		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 >> +		ready		1 if the function is ready to be used, E.G.
 >> +				if userspace has written descriptors and
 >> +				strings to ep0, so the gadget can be
 >> +				enabled - 0 otherwise.
 >> +		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 >> +
 >> +		All other parameters are set through FunctionFS.
 >> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/g=
adget-testing.rst
 >> index 29072c166d23..fcbd8bb22db4 100644
 >> --- a/Documentation/usb/gadget-testing.rst
 >> +++ b/Documentation/usb/gadget-testing.rst
 >> @@ -206,6 +206,14 @@ the standard procedure for using FunctionFS (mount=
 it, run the userspace
 >> process which implements the function proper). The gadget should be ena=
bled
 >> by writing a suitable string to usb_gadget/<gadget>/UDC.
 >> +The FFS function provides just one attribute in its function
 >> directory:
 >> +
 >> +	ready
 >> +
 >> +The attribute is read-only and signals if the function is ready (1) to=
 be
 >> +used, E.G. if userspace has written descriptors and strings to ep0, so
 >> +the gadget can be enabled.
 >> +
 >> Testing the FFS function
 >> ------------------------
 >> diff --git a/drivers/usb/gadget/function/f_fs.c
 >> b/drivers/usb/gadget/function/f_fs.c
 >> index fdd0fc7b8f25..ae44dd5f3a94 100644
 >> --- a/drivers/usb/gadget/function/f_fs.c
 >> +++ b/drivers/usb/gadget/function/f_fs.c
 >> @@ -3446,6 +3446,20 @@ static inline struct f_fs_opts *to_ffs_opts(stru=
ct config_item *item)
 >> func_inst.group);
 >> }
 >> +static ssize_t f_fs_opts_ready_show(struct config_item *item,
 >> char *page)
 >> +{
 >> +	struct f_fs_opts *opts =3D to_ffs_opts(item);
 >> +
 >> +	return sprintf(page, "%d\n", opts->dev->desc_ready);

 > Don't we need some locking here? "desc_ready" seems to be manipulated
 > always under ffs_dev_lock().

Ups, indeed. It is just a boolean, but the instance could disappear from
under us.

I'll send an update, thanks.

--=20
Bye, Peter Korsgaard

