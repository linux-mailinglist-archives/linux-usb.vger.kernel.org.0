Return-Path: <linux-usb+bounces-23651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43776AA7569
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 16:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F7DD7B54E9
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484FC256C66;
	Fri,  2 May 2025 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeefJHrD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99C156C63
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197708; cv=none; b=uZzmncscI6nkDcezu8i4wEy14WuQp/+3euX6GX7d1rNzh/wpnZPPECcDDWVisseErgETvpXM4DRChVFqCHNhEOqsxeyplSw0VjmlKgHjo+am0IfnZzw3ZQHdPhK+59JD/y/nYx6yFAn8sOurfnDD9k/VT18iW7EBAXcrXaRkqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197708; c=relaxed/simple;
	bh=RpJVwCDKSnByw8jtUR+cMwoe+OU/wu1hEclu+sJDocE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=Ez59LlC41tnV9BP+4CL1SFq23k9YeY5QjPFPdcO7fNETvTLR9FZb0sVI/ClUYfT1TTNLNkxYp89j6e81stmMDwek8tdd/hOTrJhnVb4aq8tD8knACdbFNwzWvbtcHnO42sQaxg1gLNviYAy6VK8X0LldeIEJPUvuorTXCJSMS4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeefJHrD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so2067715a12.1
        for <linux-usb@vger.kernel.org>; Fri, 02 May 2025 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746197706; x=1746802506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=EeefJHrD/Kd2H3ltFzeAH3rnjrZBPIL1//no2VZli1SwbgYmblTCWQocm+3uCzUjvs
         oao20rOiUmtyCvrDiEd/FsfliFOMs0XBlhV4vQA6ookb6/dLVBCHOazJZE5flR5RKaD4
         q6slw7wkpAv6nwSO1/UyAM9iQFBnQaKnkwrWRsYQAA0aly+5N3uH4PBONyLxpeP47EBH
         BySwEvy1FYm0HaUqksIs0ViFSsCDhH+KmEDC5tAfjL+4da8sN50fiNXW2WwUG8dNRQiG
         yT5btJD7yY1J6joN2LPyfT/YKiOeHk40zSHwIs/yIdIYLWljLKPT6JZNfZTwer1128nF
         l+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197706; x=1746802506;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=Dq5OAXj7ijEZPEt+BRXqjtFFD7fgG90o2amKMMka/g9s9yNHxw6JzySYzs6MrEexGM
         PwwRTNBd1iE29x71S1etzOqFkXRhToW+gnwbQrNJ12OQ8Y5Fvhlrlzf8q80634Y+l4e4
         2hwam/wnmFuJoXcY0rAvgDni6SE+09Ia+OyBtKvo+eEl3bqajM9qYPrRXabSOs0sgDqg
         f09y6bzvHj+9ctVZ2y4YbbyzeLCRl2tjwT/7sPmZGOzhcLvR3dbOeIE243qyJUV7YWZL
         Fg51/Wzcv4XB8O68j9qPhZ17T1YlxTUsDiNgbppn+SqBAoDshfdVNJoHleb5IcCB0T9o
         62NQ==
X-Gm-Message-State: AOJu0YxPqFbrxGnEjsVrwuTEIXtvvCMu7hdzMjKDhn3AmGX1g8sXxI/f
	uBRJaKK/HAWrkNDRJjEK71C+Qp6nJhPHjxScA/g7xQDRUz0LZcHPDIphkWmqlYw=
X-Gm-Gg: ASbGnct/0t5au+56ifFDAA/we9NjXwjTG+Mb08pN1UlpkiUtL2kyUdK8M6+HvsnAV6b
	iYcPunIhaQmRQQfvJjDLuL2TyMrHKwQWcR6vT6E8mA7Z7vAkZls+VkdzzcXJyU6Gh13RI1kUhAG
	+TGwtPZd+4HS2WOhsEx2RRXLWH0FIaitHjaRQFewTw3PSHaktHH6u6fWo0gHCPZqDd8EnZU0h5U
	UVNKrxPV9YPU75nXjG3yAKmBd3HZzbAEmpkhMwR7xwNPo19Vh7KDisZHOvXJe+ZtFEch1raMhik
	Ta9A++b2WbHwe5gWkAjE1h56/4EpFkk5nla+eEQlR/EdcsuM2Yb0vK59gAfaq54lkEnl6Ul9pt1
	NG9p4E6P7kFGB7rII
X-Google-Smtp-Source: AGHT+IH4VhhfA8vvJL9+UHHFEG+Gebu8h/dC79vNrkvUcBzD7QjwnU8GaQHVOSluLSngSTqEmX8axA==
X-Received: by 2002:a17:90b:37c8:b0:309:be48:a77c with SMTP id 98e67ed59e1d1-30a4e5c6388mr6022558a91.18.1746197706182;
        Fri, 02 May 2025 07:55:06 -0700 (PDT)
Received: from 179-190-173-23.cable.cabotelecom.com.br ([179.190.173.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0aasm6423373a91.35.2025.05.02.07.55.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:55:05 -0700 (PDT)
Date: Fri, 02 May 2025 07:55:05 -0700 (PDT)
X-Google-Original-Date: 2 May 2025 09:55:02 -0500
Reply-To: sales1@theleadingone.net
From: Winston Taylor <sglvlinks@gmail.com>
To: linux-usb@vger.kernel.org
Subject: wts
Message-ID: <20250502095502.C257A67435DE8641@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello ,

 These are available for sale. If you=E2=80=99re interested in purchasing=
=20
these, please email me

 960GB SSD SATA 600 pcs/18 USD

S/N MTFDDAK960TDS-1AW1ZABDB

Brand New C9200L-48T-4X-E  $1,200 EAC
Brand New ST8000NM017B  $70 EA

Brand New ST20000NM007D
QTY 86  $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA

Intel Xeon Gold 5418Y Processors

QTY $70 each



CPU  4416+   200pcs/$500

CPU  5418Y    222pcs/$700

 

8TB 7.2K RPM SATA
6Gbps 512   2500pcs/$70


960GB SSD SATA   600pcs/$30
serial number MTFDDAK960TDS-1AW1ZABDB


SK Hynix 48GB 2RX8 PC5 56008 REO_1010-XT
PH HMCGY8MG8RB227N AA
QTY 239 $50 EACH


SAMSUNG 64GB 4DRX4 PC4-2666V-LD2-12-MAO
M386A8K40BM2-CTD60 S
QTY 320 $42 each


Ipad pro 129 2021 MI 5th Gen 256 WiFi + Cellular
quantity 24 $200 EACH

=20
Ipad pro 12.9 2022 m2 6th Gen 128 WiFi + Cellular
quantity - 44 $250 EAC

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

 Brand New ASUS TUF Gaming GeForce RTX 4090 OC
 24GB GDDR6X Graphics Card
 QTY87 $1000 each
=20
Refurbished MacBook Pro with Touch Bar 13 inches
MacBook Pro 2018 i5 8GB 256gb quantity $ 200 EACH
MacBook Pro 2019 i5 8GB 256gb Quantity $ 200
MacBook Pro 2020 i5 8gb 256gb Quantity $200
MacBook Pro 2022 i5 m2 8gb 256gb quantity $250 EACH

 

Refurbished Apple iPhone 14 Pro Max - 256 GB
quantity-10 $35O EACH

Refurbished Apple iPhone 13 Pro Max has
quantity-22 $300 EACH


Apple MacBook Pro 14-inch with M3 Pro chip, 512GB SSD (Space=20
Black)[2023
QTY50
USD 280


Apple MacBook Air 15" (2023) MQKR3LL/A M2 8GB 256GB
QTY25
USD 300 EACH


HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 237 USD 100 each


 Best Regards,

300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 570-890-5512
Email: sales1@theleadingone.net
www.theleadingone.net


