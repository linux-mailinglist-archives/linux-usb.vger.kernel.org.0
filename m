Return-Path: <linux-usb+bounces-35929-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECYwOllpz2lPwAYAu9opvQ
	(envelope-from <linux-usb+bounces-35929-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 09:16:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46571391A18
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 09:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3A0302BDE2
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 07:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF5C372B52;
	Fri,  3 Apr 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KchRWfgN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3E31F9AF
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200589; cv=none; b=H8rZ+IKrtJBMISnjH4onjTfqVhpMs0fUXzOglfm6vXOA1zD/pC2pWJ0VCG/5oFpaS3AgzWCDH2Xcd3i4pDyJZAoT/LzvbLgs5U0OdmnrkX7594KAsHH8RwG2grFYlPTzeuEpFIR+ZFAU+7YqG2vKoS+ZEeKRst+OOqsCxgWfyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200589; c=relaxed/simple;
	bh=0nZuTcmjVogseCLtgK8tavuElgI++B7d7DDySahhkKg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6BSphwU2Go4LMGg8K+85meMYVDg5HR0MY6CUMNSYBJQgKRNYWFYZRHQkwH4USP2onTPHP02DfhRe3g9CetabnmX/seQorwAebpMik1oDIJX+xrnDlkc6kQSNePS6jfqwJx2RFxeMi7bkb0rEOtau+aMe8O3xT5e2difoUZLNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KchRWfgN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso14696115e9.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775200586; x=1775805386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ5txd2ARz+JAlbloDyJ8LSIfv4wwpP/E5PFDh15gDc=;
        b=KchRWfgNHLukxa1MTJDd4+/Tif/KcqilOQtf5KFCKJRQkPKE7KuNhnSZwJoP2WX95a
         UmOvsmPqhlIl+CAZPj1lynXttNFdu7EEGrg5wY85PaKz4Ys0iK6RNrVzxjupBgCbAxpt
         eEM+f6GKPqGJtWtZW2s2Y2oIRgYUC2QV+1dmR6XHLHyPXC9UwM+kavxJ6qwSPsQ82xVG
         ljmy21+r9l4sD/W2YC698WlY+m1cbOXsnpk3/Z+tPc54DTQcaHwJov3t5Oqz47D0pDx+
         pMJ48ksUdUEH/rrNg8Jx5Mh6LDe1Fe9rWgdC8XMob6jCSkerwOi07AjStbrtd5yqmw7S
         pVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200586; x=1775805386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZ5txd2ARz+JAlbloDyJ8LSIfv4wwpP/E5PFDh15gDc=;
        b=iOtOJz6wDLsg+pOW25wHKoeu70IZXzso5zlJpW3MxFdo3M7KDde6aGp5zU90Asmfm7
         Lr/va1CThapBMDsTHnZ68wQV3OxRPKPPpLfjUOXsSDPdufyRFCEsfH0RLH9J1zuKAETa
         R/1IrHkhHdgP/3bpCrQBYS+nOAccQOSyDDknArQBV71kgpykn4AlHNGSo4Oer310V6Iv
         ENziJcqAjKsd0jaXHbUwlZPebigBdG5uLSmzmMVNJLKKKJkn4NoCKuBjMycPo2tptnUg
         5cHaQLnPA91LKpVE8nSN7CvkrcfOPDshjcMMNYJxZKn2dLkIamDbsCtbBY1P1sH/JLfH
         4uWA==
X-Forwarded-Encrypted: i=1; AJvYcCVq2dDoiTNCjdMrKKQ8lMxjxnSCFuGuw2/+iW++gXPTf5AAozvP1rhPDbWmYp1MUQMJPZcdvQeD/co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7RJ8uxjAPGgAn8RY84Pkq12RiiaGDxc8wLaZHQl6Ns50liL8
	SoNYO0ZuDjpfZ/X0x1PLnCIi3954vMbCdPNuWqiMAjz3jpcA7wQOvEa/
X-Gm-Gg: ATEYQzyzd2rJFiem6Bvg4wCzNJ3aQ5plXTw5EV4N+/NC5jx0O/GkuGvOqERhZUKYvzF
	6XBE8Dy11U6ZbdblXSv5S1mQsA1QM7BhzOXRNe2t2nMeAohyfsAHHGAIn8x/rqHtIYdbK7zljQT
	EwAxxKiNHsPGdP7KfQV954GMMTJ5zg9sNqWi3VUyHZHC7ymtgB7Znh0QJGuJI4LMa3Dx2PgK4Xa
	MSmhOOcKFvfkOotFhePycvVCHFLWX4yBlgyAALPJaa5AEfIDm5NhejfHP7u5HMjzj7P4Wr5GYQz
	0FD0UDItDRwIxT1IdujxTfKCRA+OGnPvQYPV1rUP76AlD4rwWYY7eeWR4uPvwzZHmVIiy/wjbvo
	F77RjxVN0b5VlVd29vxgGce/hr/FxJOXOJ0rTIdiM02z51QZVP6JfSywt5nyhRMtqY6C2Dm1BVe
	+Yq/gzSL/NnyhGsl4QDSorkhvYRkUgQ+d+
X-Received: by 2002:a05:600c:1d1c:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488997d1387mr31070665e9.27.1775200585837;
        Fri, 03 Apr 2026 00:16:25 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm241111235e9.1.2026.04.03.00.16.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 03 Apr 2026 00:16:25 -0700 (PDT)
Date: Fri, 3 Apr 2026 09:16:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260403091621.5a685d6e.michal.pecio@gmail.com>
In-Reply-To: <85ad518a-f87f-4ca6-a11c-1ccc37d60bd1@huawei.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<20260402114421.738e375a.michal.pecio@gmail.com>
	<85ad518a-f87f-4ca6-a11c-1ccc37d60bd1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35929-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 46571391A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 19:55:16 +0800, Xuetao (kirin) wrote:
> > Any other examples besides AX88179?  
> 
> We tested 18 different USB 3.0 docks, but they only contained two 
> different types of USB 3.0 Ethernet devices based on VID/PID.
> The dwc3 controller works fine with all of the devices mentioned
> above. The other USB host controller works fine with all 12 Realtek
> devices, but fails with all 6 ASIX devices.
> 
> 1. Realtek USB 10/100/1000 LAN (12 devices)
> All 12 devices share the same VID/PID and descriptor values.
> 
> VID = 0x0BDA, PID = 0x8153
> wMaxPacketSize = 0x10
> bMaxBurst = 0
> wBytesPerInterval = 0x8

My RTL8153 has this endpoint for its default proprietary configuration:

        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0002  1x 2 bytes
        bInterval               8
        bMaxBurst               0
        wBytesPerInterval       2

which should be problem-free, and this for its CDC configuration:

        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
        bMaxBurst               0
        wBytesPerInterval       8

The CDC configuration needs to be enabled with a patch, I'm not sure
if there is any other way. It will then use the r8153_ecm driver.

--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9641,6 +9641,7 @@ static int rtl_fw_init(struct r8152 *tp)
 
 static u8 __rtl_get_hw_ver(struct usb_device *udev)
 {
+	return 0;
 	u32 ocp_data = 0;
 	__le32 *tmp;
 	u8 version;

> 2. ASIX AX88179 USB 3.0 to Gigabit Ethernet Adapter (6 devices)
> All 6 devices share the same VID/PID.
> 
> VID = 0x0B95, PID = 0x1790
> (a) 4 devices:
> wMaxPacketSize = 0x10
> bMaxBurst = 0
> wBytesPerInterval = 0x0

This looks like my AX88179 and it's obviously broken.

> (b) 2 devices:
> wMaxPacketSize = 0x10
> bMaxBurst = 0
> wBytesPerInterval = 0x8

But this is odd. When I use mine, I see that the driver submits 8 byte
URBs and they complete successfully with 8 bytes received, no babble.

ffff888100981b40 3364969734 S Ii:2:010:1 -115:1024 8 <
ffff888100981b40 3365097706 C Ii:2:010:1 0:1024 8 = a1000800 79490000

So I think this should work even with bandwidth reservation set to 8.
Can you check what happens here, before and after your patch?

Regards,
Michal

