Return-Path: <linux-usb+bounces-28979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5FBC2B16
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 22:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A863018988E1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 20:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF7523BD1F;
	Tue,  7 Oct 2025 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH1ANkE1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBC23815C
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870087; cv=none; b=YbxjkVuB20SFaedB0PxvZEkLgD99lByuPHbKQLc05eBKAgmnS2GwdAgvt4qZGU5VVBlu84zljGsyMXtGYvJ9Qhldm7dkeXs4GUbG7Zer1eOKbo8FUq5mC+8c8XJAS+F/ZLCyfzfmXkLTbPPvC5ITTnAtWrlsksqIETa9XIAclEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870087; c=relaxed/simple;
	bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XYV2MvUYweKNAGRK863jWAmzFKVzL6IpordmvAr0OpqU4Qx60J2kasOuCVuAe2jsYmhXVgVayQVQ1Z3+Ua/5lyWEzE/X94Nb0KjNO1bq7K81FUS2srnWRQkAEIh6MsJLqe8oojB1dmgOHbD2ZrmG2IESgA8q7IbA0amZsh1JBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH1ANkE1; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5b658b006e2so3427039137.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759870084; x=1760474884; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
        b=XH1ANkE1ALEXNLOCbywxS40nRd0XR20x9tMwyl9sHxQNaLD5Xk7oxZkwScmsQ4pyLf
         xsk+PHbiE2bJ+HY5Jmw6+8ln96P0L29Nx/TBp4NoXatdHzFmU/M08RcmxxpGVUY3MWwg
         DFuk9EZ/B8DMaKkGWzcV8b41FQqs2zW6QM4yzHJqG41nBZPkkoJnfpUzdtgI2tWBlpip
         kIB4aKf9NtUQFy8XyP+qoip0Al6J/u+ogAiqcu4mk7qgbr6SUeAgT4ulVmGNFVPFJEu9
         n9wtJcZ6YD/0BKkCM01xEAIDKQA+SxXIPP/1XpR8/kv0jzIbI/LThD8GBmO8DjHmtsEi
         W/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759870084; x=1760474884;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
        b=PeC1197tJTZj8Vj16o9EQRj2upZgcebiHe8ZG4HeDqHu49YJKH1vycTW1WuEdBasQL
         ED4/STFn9hNmE8DECgCJeW82OB5C+peAQCE4WVi0k0PV8YX+280HosPG75xiMsMBILQh
         pfTVq/UspIYrpJK/CGIp/pSD2EHgdyfKbKfa6umlHYTZwymFhcswC8k8BiFghJJnSFG+
         6k/zG/bV0uLOxQcXvCGIR7o1CPAle7lt4KaTkNk1m8GCMJKommIPfCm8ITsn1qv3jVQi
         mDn6vkAhOxLT+jY7JYQPZv8p9pMZi8ycBZpjfgsPlm6BmSw5TBaqwnyvmElb2ZbID7c7
         mgcQ==
X-Gm-Message-State: AOJu0YzbLHiJAS5u1/tFiwh+OsJVg1W80B5nWL9N4vAZoLNvvmSF9EVg
	n1UXrgWktdSa1F5sNO1lr4VtlhRsp30x+cKjtE5ORkkA1ULdOTlj97nUdiaxA6ElrgAxklKz5dp
	7NICBTc2+iDVXUZehwVNxhjtxMCqVZNh3b3GnTb4=
X-Gm-Gg: ASbGncsjOJM1wrm17pSv6l0fEssj0Jf19oi5Joa4mHgSJi8SrqtU6mepXENUuHShZMa
	NtziA1Ix3IrtOqINPjRRkF0CJ9kl7mV0hHHBQOR6bpbZIWkhuS+w+JQwJk8MXsonXujVbu7g2dc
	GBMLvpWOJaCiS28NsVvMgrvaD88Va0z/TE7S/Aj3ab5lBEEyjNb5pgrP0rrgwomEYj+jGXxZLhQ
	ewHoLB3D5G/PutHkRd+O/QgZ6lOpGw=
X-Google-Smtp-Source: AGHT+IFMyOy5pzH+ob03cL1zxEYTuyJg66UXDzt8N9Fm+hjIboye+WAMWe4+j8PuwB/p4bLcJ3HugU5csydDDdia4Y4=
X-Received: by 2002:a05:6102:6442:b0:522:f65e:c76d with SMTP id
 ada2fe7eead31-5d5e23b0e35mr434638137.23.1759870083857; Tue, 07 Oct 2025
 13:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Tue, 7 Oct 2025 22:47:52 +0200
X-Gm-Features: AS18NWAkTXxu5Hq3X6oLjNGGzRW09_ajbmmezWgLhZDINHtcebdmkGp5mup4UoI
Message-ID: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
Subject: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: linux-usb@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

this is my first time here, so I hope I am doing everything correctly,
if not - help would be appreciated.

I found regression in the linux-mainline aka linuses branch, more
specifically in the recent USB merge (commit
c6006b8ca14dcc604567be99fc4863e6e11ab6e3).

All my USB-C client -> USB-A host aka computer(probably all USB-A
devices but I don't have more to test) - devices are not detected when
I boot with this patch, I have to replug the device for it to even
show up in dmesg logs.
One device is mice and another one is audio DAC that also shows up as
hub in the dmesg normally.

I reverted the USB merge and everything is fine again.

Happy to provide logs if needed but as I said the devices do not even
show up in dmesg logs on boot and there is no message related to them
not showing up.

Thanks,
Arisa Snowbell

