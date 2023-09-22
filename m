Return-Path: <linux-usb+bounces-511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844F7AB29D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 15:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 52B24282373
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 13:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0D627726;
	Fri, 22 Sep 2023 13:23:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2552770A
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 13:23:47 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA3BE8
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 06:23:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so17449335e9.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389023; x=1695993823; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wWM81lNRYAlyXrLjnUe0eilais4mQdUPC5lx/4oo+Gg=;
        b=PoI7mtmV6UhxGilwiH+Xa/uoiHuucMHGIg2btNf9BQpqtT0jwJ2tSenSFjfVc6ELRL
         4PYwA7P+8PqXT2MT+LciMRWKW12lVmMIVrN2S/+uFegSUsObJX/b/rq+Q+XDTuziMtVq
         Ax/m6hHlttODaUzYOYXLOzNF/WvVzEi1eIvNsWjEQ/dFX6v8PiUma2wHlpaUEnfHcapG
         Jwm9oduL/2MmWp4CK0ahlJ0bzxMn4ll6skemtY0GP4vlmK+kZvxOqEi2hCCOddvx4Cto
         7Zy2oDHxEpiZVYT+JdxO0BErYOQKbFlMZjB9AVFI/HZFJdMkXYkY67w48tjooc3CLMB6
         c1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389023; x=1695993823;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:reply-to:subject:message-id:from
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWM81lNRYAlyXrLjnUe0eilais4mQdUPC5lx/4oo+Gg=;
        b=jINVR8ryrMpKpfdTAocdVRgFV5fDEtjgkga4yxdblPpgYOjCO1WYJE/729oWVTnGh0
         qPwfZpg2W6M9DpDCc38SdqoZ/fZyK1pfPkOFLQgdSUMuQFU+s7mmzUxU2bgz4CibzBt9
         Cq/KrThlOFBpf6T4tdS3fGuqmudfDFNVeQeFCNvQvj9QXMyps6hMQu9e684fjyPPJNnQ
         sl4RRNbbNpnXaP5eNKdHzpM9u5Q2/4m4AXv4c0AOoW2CytyFY6K/e2jAham7B2UoURq5
         19VHMKfwCEJS/XB4XhQQLKg5tWdyAvVoYk57gpmRXwPeY/AvceEVuyma7cPO8/3OvJdb
         DEJQ==
X-Gm-Message-State: AOJu0YyyH1lYL4qrsxuy6OV3QwwN60ogSUbf/deg7hjIVMO3i/NQNzbq
	R75qntoVCMRYkmokuwlod7HRCSZtGzg=
X-Google-Smtp-Source: AGHT+IGO/HtIeMDyn48lyXKSotHpLKCIm+pYkS7e7+MfWiqFekJrsRT1SNxNy7hhVo3uwienp2TUag==
X-Received: by 2002:a7b:c8c4:0:b0:3fe:d1b9:7ea8 with SMTP id f4-20020a7bc8c4000000b003fed1b97ea8mr7243335wml.28.1695389023077;
        Fri, 22 Sep 2023 06:23:43 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-006-054-203.77.6.pool.telefonica.de. [77.6.54.203])
        by smtp.googlemail.com with ESMTPSA id n15-20020a7bcbcf000000b003ff013a4fd9sm4687230wmi.7.2023.09.22.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:23:42 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
Subject: Re: JMicron JMS567 and UAS
Reply-To: burcheri.massimo+linux-usb@gmail.com
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
	 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
	 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
	 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Sep 2023 15:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, 2023-09-21 at 10:23 -0400, Alan Stern wrote:

> > > > coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan=
/

> That email refers to vendor & product 357d:7788.=C2=A0 But your device, a=
s=20
> shown in the earlier email message, is 152d:0567.=C2=A0 So it's puzzling =
why=20
> you referred back to this bug report, even though the devices do have=20
> similar names (JMicron J566 and J567).

Sorry for confusing.
I wrote to Cyril Roelandt and he said that he noticed that old thread had a=
 typo
with JMS566 and he was actually using the same JMS567 at that time.

Though productIds are still different:

Old thread:
[Tue Aug 18 05:14:19 2020] usb 2-2: New USB device found, idVendor=3D357d, =
idProduct=3D7788, bcdDevice=3D 1.14
[Tue Aug 18 05:14:19 2020] usb 2-2: New USB device strings: Mfr=3D1, Produc=
t=3D2, SerialNumber=3D3

My Log:
Aug 27 19:00:47 [kernel] usb 4-5: New USB device found, idVendor=3D152d, id=
Product=3D0567, bcdDevice=3D52.03
Aug 27 19:00:47 [kernel] usb 4-5: New USB device strings: Mfr=3D1, Product=
=3D2, SerialNumber=3D3

> If you can, start by figuring out why your kernel isn't using the uas=20
> driver for the JMS567.=C2=A0 Is the driver itself blacklisted on your=20
> computer?

It's not blacklisted here afaik. This would be done in /etc/modprobe.d/*.co=
nf
and I have no entry about that device.

So you mean if not blacklisted by kernel and not locally blacklisted, uas i=
s
just not supported by that firmware? I'm going to check if I can just try o=
ther
firmwares that were reported to support uas.

In the past I already got an enclosure supporting uas by just switching the
firmware...that was:

Nov 23 10:25:27 [kernel] usb 4-6: new SuperSpeed Gen 1 USB device number 3 =
using xhci_hcd
Nov 23 10:25:27 [kernel] usb 4-6: New USB device found, idVendor=3D174c, id=
Product=3D55aa, bcdDevice=3D 1.00
Nov 23 10:25:27 [kernel] usb 4-6: New USB device strings: Mfr=3D2, Product=
=3D3, SerialNumber=3D1
Nov 23 10:25:27 [kernel] usb 4-6: Product: USB3-SATA-UASP1(modForGentoo)
Nov 23 10:25:27 [kernel] usb 4-6: Manufacturer: StoreJet Transcend

Best regards,
Massimo

