Return-Path: <linux-usb+bounces-16438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DC9A4E5C
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 15:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A2A91C2151B
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 13:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938251773D;
	Sat, 19 Oct 2024 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+lUdLdk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E63620E31D
	for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729345674; cv=none; b=Mg+H6xFIWUtzItR9EUnsrbOqtBDGMNy4k2aZ8TbH5T/aMtjG3aU+MtZBossudduJ3euT8bjZT5RK9sHUDwFHikVUUPubmtsg5WNJgufYV2HC+NlXF0BVg6rIY63pyi283Xl86XadiRnek2WCeswv1aDjPn9OCyQHW64XVoyCmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729345674; c=relaxed/simple;
	bh=QFtHsDAo8eRdXVeE+8gtAOyR7d7qibbOmOneluxUPEM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ZKoNZ482M++HviP56PolJcqJysQgYmw3ts3SNYL3sGTkYoV/PHvxG+zpriNTOYKerpLlqGO9XiiqggCwZos0xf9zcKbBo7sjJuGnvkdq4vzTazkzAoLX00aC+c05scy6Wqy+UfR6H0ERdz/rpFkbCE0+FSD9ZF8HOO+ayDAFH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+lUdLdk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a998a5ca499so368027166b.0
        for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729345668; x=1729950468; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=veqyDiLHY0j8V5KXFhB1SozGnZEPx4o32q6Ee4fVrCI=;
        b=Z+lUdLdkzKNKz8tzMvRD/SZZzlmGEQJZ0KRu0AOJvPznTDnlG+n0eKpU/OoB0YFV3F
         ExOYryVG9Q1ORLwJdVWFXWT/F7NgmFgogeCKkqqyOySbg5bdlSNkvzd7En+mjap9gO45
         JKwL8FdscArBLqHlAAkil0BG06Ko2ghXNynxxyDLGlRXVOw5wAc26S+iudMNn4gwZ36F
         vO2GTnuOo2nBcWjVbYjb22/iauo7ns3pKv1+X19evZaGJ6iPpyKfs6F/oFenBaZPpjoJ
         TTMo85EvXlK6d+UHR6+Pa2IcOdq8L9gShi8k7KZ3SqV8Xk501+hLL+/sc6eeRVdZdrVS
         pwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729345668; x=1729950468;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veqyDiLHY0j8V5KXFhB1SozGnZEPx4o32q6Ee4fVrCI=;
        b=BJRRkuKTclEhl6LQRUBm5Wa9wyugEI1ywva31R9QQMZiP5OCXtJr6/anhmeSK63wRT
         qd5AXHmVn9mgyXiPXPGeqPuW9B3Dcw9cKsMnXqPq/m/fkJP/TRJh+ZvaacHnrD/SrZKa
         oAo65R3NDTH8ZFTePozQrVtdwaR1XGfCMQn0eOJHBKXEm1G5SDJr+F/rJjs7QsR5jX2a
         Eim/8asVKkM3kTE+7LYZhIFhHg6ZEua6fkKvi4iZsmRRoTTvAvwMhFNTjIY9u4qPRoVO
         fo+mmIANXKPWaIhlVA5JYIlRmmoaKth3BSdVfn4XoHH+UJx9Q7DpqRl/T6GgN99GjP9l
         qcoA==
X-Gm-Message-State: AOJu0YzFqaoN1mRD52o4HPKUHK8JhMC5+LUN1x4X+oT+fRTWke5sWv8e
	cxKtPiA3/Ig2LJWhdu8DaeE4bvRj0C/SWvxj6AdSjgHfgDNovCNP4mQioZHx/WPnkdJlhbc4U6R
	lzRvCJbfB8il74XvdorLO45/cM8rYuEndOrI=
X-Google-Smtp-Source: AGHT+IFKAGqL9ymx+9+yJwneQaaS0URmUX/SG9hjk/WRAMj8Mmp9ZKfmBYSDfeDd0bF+Q3bxqrkTqA0HiH+y0WHFgpA=
X-Received: by 2002:a17:906:c106:b0:a87:31c:c6c4 with SMTP id
 a640c23a62f3a-a9a69a681bbmr566549366b.24.1729345667704; Sat, 19 Oct 2024
 06:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Sat, 19 Oct 2024 15:47:08 +0200
Message-ID: <CA+1FSihHXW8TWSG8x5xTPShvNOQ2-0RK8xOEt9rKz93apv-Z2Q@mail.gmail.com>
Subject: Information request for your "android_external_usbip"
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello man.

I need to have some specific information regarding your tool called
"android_external_usbip" from here :

https://github.com/trevd/android_external_usbip

I may need to install it,to accomplish the project that I'm working on.

What I want to do is export an USB device from Linux and import it
inside a specific version of Android,version 7.1.1 and I'm forced to
use that. I can't use another version of Android. Basically on Linux
is attached one USB to PCI controller that has 4 ports :


06:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0
Host Controller (rev 02)

07:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0
Host Controller (rev 02)

08:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0
Host Controller (rev 02)

09:00.0 USB controller: Renesas Electronics Corp. uPD720202 USB 3.0
Host Controller (rev 02)


On the port 6 I have attached a mouse and I've passed it to the Linux
VM using the bhyve hypervisor.

So I want to export that port or the whole USB controller with the
devices attached to another VM,this time is Android 7,with the goal to
move the mouse inside the Desktop Environment of Android. If I have
understood well,this can be done using your tool.

Another aspect that I didn't understand is in the scenario that I've
explained,does your tool act as a client and server ?

Because I read that there is only the client. But I need to install
the client on Android and the server on Linux...

Thanks.

-- 
Mario.

