Return-Path: <linux-usb+bounces-3771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549980666F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 06:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99F4281F0E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 05:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA924DDBA;
	Wed,  6 Dec 2023 05:10:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 774 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Dec 2023 21:10:45 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978B7188;
	Tue,  5 Dec 2023 21:10:45 -0800 (PST)
Received: from localhost ([80.209.221.177]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MuUvU-1rRa6d307e-00rVDB; Wed, 06 Dec 2023 05:57:37 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Dec 2023 05:57:37 +0100
Message-Id: <CXGZGEBGA58J.3CX7BKVV2EUHK@holesch.de>
Cc: "Valentina Manea" <valentina.manea.m@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Hongren Zheng" <i@zenithal.me>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usbip: Don't submit special requests twice
From: "Simon Holesch" <simon@holesch.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.15.2
References: <20231130231650.22410-1-simon@holesch.de>
 <2023120641-krypton-presume-a375@gregkh>
In-Reply-To: <2023120641-krypton-presume-a375@gregkh>
X-Provags-ID: V03:K1:tCHZ4gb+sEMuSuuvLLnYBL4UZRAdD1wYRUP9ZQGMkCK8d2KqZgN
 l9ZDICCFETLpD/ixLbnSMS8BaraDvXphGU1Dtn3KYm8D8sTNLzlHXpJbUlXTbCO1c8Rxufv
 n04T80XeBbLB+pKOyeJJdtRX/RWtRwdIhlk9ep+ct9BN8kIwM5z23gI6Z4vefBpF0Vvgs4w
 hL4OMCdahx6Ktjrz344jw==
UI-OutboundReport: notjunk:1;M01:P0:jmQnVkyOyQg=;s138cwMb8b1W3fDoAnPcRP2w4R5
 Z6K6fBOnVaJJC7b0YTpLdNKs1C3mvuE3iuRqnZLk/mNrkiVEB/1kpmBB5D62tcawTHMxs7rlQ
 ryoLySywKmVQYehFvb+6H9rhLLsjJKDmQm4wN/Lf4eEXgF1lfMEoLzh27a6Kd+GrnWOz6GyDf
 OBuw7J2nueqO8TnHAqOvvlnPO3Y1T8+hlbJNrR/A2RafBCs0pAht+zzKhy+zxRfQKuiQCeA1i
 XYghmfm8bGRNTgmJMcxnCPjPcqRfa9ZGB0FHWSFeG0TQNcYo1pH2BZyR6GiVxh4e/6RdVSUZZ
 3LzG3Erg+xW+aIw9posMhY9vB2YKLrc4lLLZ00Eoc0Q9vGNjx8p59HT2L3DCrwCIRCbidYe19
 8jv1KnH04EsBAlbVxGqTcyDrm2d815vYb7k20iwMwSnlizTBzveIo6zr5pv2Pb+9YgDld7nEg
 e7widnPWLTY3PWXZxkPOVjjNxyKzonEaDFaaq8vRHI7nWZ6adXqTu0MSFIlDBxGqEzgM/78yW
 ZO4H5MbZfFnZY9qlNAgIGVGjt2Uu9uLYfU9gn+hMpADvsM59bHg9Vrmx6BUVf3klbprOgr5SH
 G1f2Ux94LqELdHoWL2N2l6NkU+ahi0F/c1xLeONuJrK6DPr2umVREZOORurxPU0tiqHPCZQ0v
 riJchyFTprc+LvFs+nLb7iAXq8Rbk26jh3uSGVhexTWTP0lbRuEplNKL8pnSUBtvNSd295wSI
 LIwbjD4CdWqSyOsuqnuWZdnbFpWddxGmfPFxJiyB9oqXvnSZ8wTOZjRC9zz0tGjuzl12gdWcd
 ktxhjeHhCMy2vNMQSjygsyLSGanLJLxVfyq9R2PYxmVXb/Zo5wqh49gNrXgPPYigCx9F+Gfk2
 +Iu6w2sbKrmkKvA==

On Wed Dec 6, 2023 at 4:38 AM CET, Greg Kroah-Hartman wrote:
> On Fri, Dec 01, 2023 at 12:10:13AM +0100, Simon Holesch wrote:
> > -	if (usb_lock_device_for_reset(sdev->udev, NULL) < 0) {
> > +	err =3D usb_lock_device_for_reset(sdev->udev, NULL)
>
> You didn't actually build this change, so how was it tested?

Last thing I did was update the comment of tweak_special_requests().
Must have hit undo once too often, because I've seen (and fixed) this
error. Really sorry about that. I'll send a v4 with a detailed test
description.

Simon

> {sigh}
>
> greg k-h


