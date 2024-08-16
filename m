Return-Path: <linux-usb+bounces-13529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E29542CF
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 09:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 494BBB264EA
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 07:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFF976056;
	Fri, 16 Aug 2024 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="oLiYl703"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAA53373
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793733; cv=none; b=XH6XAOQFNpF3Az5dN1YJrRfrG+Su1GE4w7Orx8oZ2v7QkJgnCGWC1vd/qf2GsY3LnFlzGpHYXHq8B4FjOzX5sUYbIUtPwVLwoP31CKk2ewLqqH2N+XYBUxD7H12JvK+yCEQiol5z1vwoXtIvUlsWaZAK2dpf1iQx8u/jPQAqt9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793733; c=relaxed/simple;
	bh=iVXp+4sAB6nzy5Ah82JailgckrARfpLDPFc5k0ijcaw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=aj3uEua1YpV/En9cZVYYkc019AE2zi9zUzrH1Bqy1MXBYqLnPfMOUUz9qtuIWRkNn+/OjejE2347oY+NvkDXh12Uvl5CLzfHYrFjKQaiKYfqTh/WGhSKI9OtD6iPY1mopIjtF//FUYPnL+60b149rlmCc90JMTw13J62dC/pHw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=oLiYl703; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1723793715; x=1725093715;
	bh=AJ1mYnM5BQuvFesPgK8TVyNw70XO0806lIjYxKing8s=; h=From;
	b=oLiYl70312eS0qobe8aiY3wCwLXCIcA/MaTYIa4tol7nO8KZXJ4ba+JgtJMRBi02I
	 AFdRCUebGWqbrA6kt5tR1St+BDK2q/pdbtpAb50qRQq9SRPmmEBr3/m3bIQ8Q89a9F
	 fBLJvCPTWxhA3LwOuqupP2UzAvZdKuLGuvXF/C3U3UKXatm8m3oxFv7llsLioPuZ7y
	 e7OKYKknPuqS4Jqtmry0ZS/FpBBueolor+k0S485mraTleEztb0XlWBYQMUasujKbp
	 yLRAwPLXpk8QlomHbKeBkXK7g7XYYfg45M+gTjjONVyfwRrBzePw81hzCZRxRbe/ht
	 VeqnqiiIleSOg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 47G7ZDuG074762
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 09:35:15 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 09:35:13 +0200
Message-Id: <D3H5VFRK9ILB.2ILZSGS2ZNK4X@matfyz.cz>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [BUG] USB xHCI driver NULL pointer dereference
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
From: "Karel Balej" <balejk@matfyz.cz>
References: <D3CKQQAETH47.1MUO22RTCH2O3@matfyz.cz>
 <9f3d0886-51cb-4ec4-a060-ed0f52f7e656@linux.intel.com>
 <bb8ca342-a975-4e87-ae8d-7c0d703a89af@linux.intel.com>
 <b481b087-2c47-4168-b33f-3ced69662ee3@linux.intel.com>
In-Reply-To: <b481b087-2c47-4168-b33f-3ced69662ee3@linux.intel.com>

Mathias Nyman, 2024-08-15T16:10:32+03:00:
> On 14.8.2024 16.28, Mathias Nyman wrote:
> > On 13.8.2024 14.49, Mathias Nyman wrote:
> >> On 11.8.2024 1.11, Karel Balej wrote:
> >>> Hello,
> >>>
> >>> my machine crashed twice in the past week, the second time I have bee=
n
> >>> able to recover the log output (including the stack trace run through
> >>> scripts/decode_stacktrace.sh) which seems to suggest a bug in the xHC=
I
> >>> driver:
> >
> >>
> >> You have a unlucky setup here.
> >> This could only happen when a full speed device fails enumeration whil=
e connected to a
> >> Pantherpoint xHC.
> >>
> >> Only Pantherpoint xHC (PCI_ID 0x1e31) does bandwidth calculation in so=
ftware and
> >> calls xhci_reserve_bandwidth(). In this case we unintentionally end up=
 calling it
> >> after a failed=C2=A0 address device attempt when usb core re-inits end=
point 0 before retry.
> >> At this point the xhci side of the device isn't properly allocated or =
set up so
> >> we hit a NULL pointer dereference.
> >>
> >> I'll look into it more.
> >=20
> > The following code should resolve this issue, any chance you could try =
it out?
>
> I was able to trigger this myself by forcing XHCI_SW_BW_CHECKING and faki=
ng failure on
> address device command:
>
> [  270.538134] usb 3-6: new full-speed USB device number 3 using xhci_hcd
> [  270.670313] xhci_hcd 0000:00:14.0: Faking a Device not respoinding to =
setup address
> [  270.886142] usb 3-6: device not accepting address 3, error -71
> [  270.892091] BUG: kernel NULL pointer dereference, address: 00000000000=
00008
> [  270.899034] #PF: supervisor read access in kernel mode
> [  270.904150] #PF: error_code(0x0000) - not-present page
> [  270.909267] PGD 0 P4D 0
> [  270.911799] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  270.916660] CPU: 3 UID: 0 PID: 301 Comm: kworker/3:2 Tainted: G       =
 W          6.11.0-rc1+ #4291
> [  270.925651] Tainted: [W]=3DWARN
> [  270.928615] Workqueue: usb_hub_wq hub_event
> [  270.932787] RIP: 0010:xhci_reserve_bandwidth+0x243/0x6d0 [xhci_hcd]
>
> The codesnippet I suggested did fix the null pointer dereference.
>
> I'll turn it into a proper patch

It seems that I'm too late with a Tested-by tag but for what it's worth,
I have been running the machine with your patch the whole day yesterday
and didn't observe any regression. I have not been able to verify if it
fixed the issue as I haven't found a way to deliberately trigger it, but
it seems that you were able to do that.

Thank you very much for looking into this.

Kind regards,
K. B.

