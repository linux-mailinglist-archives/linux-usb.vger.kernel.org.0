Return-Path: <linux-usb+bounces-380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 750DB7A653F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 15:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF22281AAE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 13:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B015936AF1;
	Tue, 19 Sep 2023 13:34:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F6E36AE8
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 13:34:31 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2C0F5
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:34:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d20548adso5493404f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695130469; x=1695735269; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face:to
         :reply-to:subject:message-id:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBy3W4RSk7kZKsneze/v+0iZrBSFcrvL4jSpYOypbrc=;
        b=Pi8KtE1YaEGJFK7t0U3UvVm2lspA33Johxa2v+KYpoZ49ZFOoI4u+vCV5lqrJ+Mu5h
         abqVCryfAYvaQDHIeKAiHymo0KDbUhAh+YoOQc4KEx+XXxbF2vSV1zkGqFeo3PegQLkU
         xBvNGbXiPB0uSA4BD7qUlfBwtFc0A641BIEWx6ktlUL8bNeL1+MiVA0Ka7Xue1zFhAeo
         R790FWy0RIAH04qpkjT+ffLfYuw1x1B1oBNYGhawvyow/xWFEeTu9Q4F+EGQISoJ4om9
         s+u9YL6LX14s8BgJRXYUJTMBzOBFDjZYja6hI6qokWDei1vfWfAkv+d358SohCNQXyN7
         fD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695130469; x=1695735269;
        h=user-agent:mime-version:date:content-transfer-encoding:face:to
         :reply-to:subject:message-id:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBy3W4RSk7kZKsneze/v+0iZrBSFcrvL4jSpYOypbrc=;
        b=v20NWyB28GZRhii6Vj1T/SGTzIZhN6f3XIuNNplXXGNYZNjmMc0fLiW2ozoTYzzUI/
         qmx9/JpbcSqJjro9QXI1xo3OkfggjiRi2HaxgQMNzKk+yf0XUJ0ZNt5+HdpVKz5VzREf
         K1PZ1gaXOtdCk7z2yo1AKUaZlufOYJVpsVc1Ur85RmNjG0FR0Tae/n8EMcMveP0JQKbk
         uZz+kH1Q84Zb9dIoTS4UtB7XOUTSEie3Om4hR5Au8hSfvV+mSgKwF3/7kqYs61yPteBK
         G1+nUe0jef+pZSl9nDhGGRdacZkyA1lj07ojbLuIOQPcik+4CEo8wkHmS/x0aGhXGnOP
         YJKA==
X-Gm-Message-State: AOJu0Yxh01JQX0SE8LtbGgo838iJono3zSieJAucgX/OtdKAqU+L41qg
	aTkXR1XeI83C30FF+Qv9Wq6WyVsxc+k=
X-Google-Smtp-Source: AGHT+IEDWinHek3H2X7rHLYNZrERbrFr6UNiYlDJoCSr2tLZWni0ozksAAklBiJplUZWxJs6qqouUA==
X-Received: by 2002:adf:e78d:0:b0:314:17cc:31d0 with SMTP id n13-20020adfe78d000000b0031417cc31d0mr9890405wrm.34.1695130468721;
        Tue, 19 Sep 2023 06:34:28 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-006-049-035.77.6.pool.telefonica.de. [77.6.49.35])
        by smtp.googlemail.com with ESMTPSA id w4-20020a5d5444000000b0031f3b04e7cdsm15411788wrv.109.2023.09.19.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 06:34:28 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
Subject: JMicron JMS567 and UAS
Reply-To: burcheri.massimo+linux-usb@gmail.com
To: linux-usb <linux-usb@vger.kernel.org>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Sep 2023 15:34:21 +0200
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

Hi,

coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan/

as I understand UAS was working for JMicron JMS567 in the past, then was
disabled in the kernel, now using usb-storage.
Why? The hardware should support UAS and does so on Windows. Before 5.4 it =
was
working with UAS on Linux as well.

I purchased a 5-bay USB enclosure "ORICO DS500U3" but UAS is not working:
  4-5               152d:0567 00 1IF  [USB 3.00,  5000 Mbps,   8mA] (JMicro=
n
External USB 3.0 20170331000C3)

    |__ Port 5: Dev 8, If 0, Class=3DMass Storage, Driver=3Dusb-storage, 50=
00M

Aug 28 18:47:09 [kernel] usb 4-5: new SuperSpeed USB device number 8 using =
xhci_hcd
Aug 28 18:47:09 [kernel] usb 4-5: New USB device found, idVendor=3D152d, id=
Product=3D0567, bcdDevice=3D52.03
Aug 28 18:47:09 [kernel] usb 4-5: New USB device strings: Mfr=3D1, Product=
=3D2, SerialNumber=3D3
Aug 28 18:47:09 [kernel] usb 4-5: Product: External USB 3.0
Aug 28 18:47:09 [kernel] usb 4-5: Manufacturer: JMicron
Aug 28 18:47:09 [kernel] usb 4-5: SerialNumber: 20170220000C3
Aug 28 18:47:09 [kernel] usb-storage 4-5:1.0: USB Mass Storage device detec=
ted
Aug 28 18:47:09 [kernel] usb-storage 4-5:1.0: Quirks match for vid 152d pid=
 0567: 5000000
Aug 28 18:47:09 [kernel] scsi host8: usb-storage 4-5:1.0
Aug 28 18:47:09 [mtp-probe] checking bus 4, device 8: "/sys/devices/pci0000=
:00/0000:00:14.0/usb4/4-5"
Aug 28 18:47:09 [mtp-probe] bus: 4, device: 8 was not an MTP device

With a mdraid raid0 and 5x1TB discs I get only about 72MiB/s to the raid0 w=
hich
is really slow. UAS could do more.

Is there any chance UAS could get fixed for that device in the future? At l=
east
is seems to have worked someday with older kernels?

Best regards,
Massimo

