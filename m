Return-Path: <linux-usb+bounces-4730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6482416B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 13:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1071F22756
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 12:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB8321A01;
	Thu,  4 Jan 2024 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="XrvlPvy+"
X-Original-To: linux-usb@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775D21A10
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 404C06Yt298551
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 4 Jan 2024 12:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1704369601; bh=WK8bZJLou4k/OH68Tz/v5cv5NZRdAgVTmvLj+PCKZcs=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=XrvlPvy+SpMC/wBthrL8e86ZwJBHYzE/U2tcAXUH1CjMEhPgejWNJnVOnzE/UJZMt
	 w6Dsb22dOgDQ5bIK+On9iIUQPNwwqkh5PJ7z5LdDry7luAqgVEnLINTEonOiyyxuYU
	 plgcUL54rXefZvnbGsDo1TdYmBqvsSEbQVTU2m7g=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 404C01G7642529
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 4 Jan 2024 13:00:01 +0100
Received: (nullmailer pid 195720 invoked by uid 1000);
	Thu, 04 Jan 2024 12:00:01 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC] usb: r8152: interface driver before device driver
Organization: m
References: <20240104103811.2318-1-oneukum@suse.com>
Date: Thu, 04 Jan 2024 13:00:01 +0100
In-Reply-To: <20240104103811.2318-1-oneukum@suse.com> (Oliver Neukum's message
	of "Thu, 4 Jan 2024 11:37:59 +0100")
Message-ID: <87frzd9um6.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.3 at canardo
X-Virus-Status: Clean

Oliver Neukum <oneukum@suse.com> writes:

> The r8152 interface driver is preferred over the generic
> class driver because it provides more features. Hence
> we now have a device driver that switches the configuration.
>
> That device driver is sensible only if an interface driver
> for the selected configuration exists.
> However, the initialization for this module first reisters
> the device driver and after that the interface driver.
> That screws up error handling. Both registrations return
> error codes. That means that the registration of the
> device driver can currently work, but the interface
> driver can fail.
> In that case we switch the devices to a configuration
> we have no driver for. That must not happen. The easiest
> fix is to register the interface driver first and
> bail out if that fails. That way if the device driver
> fails, nothing needs to be undone.

Yup. Switching this around makes sense.=20


> +	ret =3D usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MO=
DULE);
> +	return ret;
> +


Why not
	return usb_register_device_driver(&rtl8152_cfgselector_driver, THIS_MODULE=
);
?


Bj=C3=B8rn

