Return-Path: <linux-usb+bounces-14504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC8968F37
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 23:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489D91F234DA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 21:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D57016F0D0;
	Mon,  2 Sep 2024 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTVhHnuU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D41A4E9F
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725313894; cv=none; b=hVzQM+C4e8+Lyleb11iz26WANTJNPqUAR8iygGa9TRnNHlt2OjLEho8fsFq2bNpsk4DzrxaRg7IvKM7KwFc7VNIDJGD4Drg08Q0HRnKyKjNyBaok8OF1e4c8IEMncfZPJKOq96UQlBfJq1rliuj2VaL5EsES5L8M+iKD9Grwu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725313894; c=relaxed/simple;
	bh=TcpSq63cfMx0039UGvatC7Hrp1hzQOiwf926hF3ivxE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rGE9uaFYcJMzvLaKYyIyKx5QyPWYiLK8FVgixLfL9RI6knlBPP36HTDjfRAVUOyeSehY2fAQLR4/6rtnDXel8lIryi3BS4Jg65joz6E9MwGgBq7bcRPh+n2/MLWDyLLk2r+n11Wt8MJamJS3DUGBT+78SeUF3o9sxxrScWgSHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTVhHnuU; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-39d47a9ffd5so17629555ab.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2024 14:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725313892; x=1725918692; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvHUi+d/g4RXNlAgw/js2UGC87ddygH/jNBZnIqM5O8=;
        b=mTVhHnuUDyCZnF0Judx10cA8PwhlQDeOZoZ6f3cy1ciGrQuJ5oFprBJ6AnmHZQQTND
         b8M/tefs6BLD8V4IIeXw53KnSKhlBH5GvpEHiSKqXaUXgJYlugDXg36NSA40KKdysR9b
         3e5nBGNJ4fErdM0pCW3tbZ/NMrL06GAy1TASmICIizHBWmfGlfNr6oBd+mLxROZlA0C6
         6gzieEuU9bZhg1ns1Cs/LcNcNVFEQSfKTHwt+IKo/r/8OgXSKVDyC1Zql/C1iU/U1YTB
         T7CXzCtCPzzf4LlPVgKmbA5bOObeGxNt1UipVhkCP49Po1nhPbHv/8EvWjg0mX4U5Gyv
         72Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725313892; x=1725918692;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvHUi+d/g4RXNlAgw/js2UGC87ddygH/jNBZnIqM5O8=;
        b=VVgiw0AKllZGroFvdXEDyC0+8sJ3guCDdRhYpPgtZJqtcE7QwIiBxi2IZfsdgkvdsk
         /oK2s+hn0T4adNlaw9ploWUCdSYbmuOhoMCgTiG+Upvh09W0nt7ajybIrOFEvlHLTDE9
         V9wsDQP7IyBTrlCtwmz2KlSXyZuwP1eid8BbTG1tWVDh3QD4iwA3EfnHtICUGBnuJ3NQ
         gV1VmGy1+6Rsh+yzVNLPP5FDK77RYi88/yA/a8SfN6WD6gtloaCntSbcKG789G7VlAoI
         TmXlKmQGx7RDKQxtt2dwoKMCDBZ8kLZFzK7PQDBkU/bcA9irGpbMHooPEvhzuqQ4HnZo
         5+Qw==
X-Gm-Message-State: AOJu0YzlC/4lvy7rsfdtea12RYsxXgxjwrZsoaur6PbFjsatUUvqVUGO
	cOtPBjkVEm7ZOlC3HP3k+WvzXs44DwWh9qzZXnyyXPUsjQHFlN9qdmSaFweGhmlvFMIT+OmZDyX
	QEJtx6MDiaeWa64t2klS5jIa+euVU53gO
X-Google-Smtp-Source: AGHT+IEJSUKFS1PjgDUd9QE0VTqBZCsJ3MPFeIG7loEnOMKXMYoMeMK/oQu0lCk6ngm3BX9UQNVk60GaZ+R5VCSp3t0=
X-Received: by 2002:a92:8706:0:b0:39f:4ec5:f4ab with SMTP id
 e9e14a558f8ab-39f4ec5f66cmr82322075ab.19.1725313891645; Mon, 02 Sep 2024
 14:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Saad Shabbir <saadshabbir735@gmail.com>
Date: Tue, 3 Sep 2024 01:50:55 +0400
Message-ID: <CAKPak7kA6Xn2Gbrv==CJbyTBHx6V9JyWXPgJPAM3wtfx5ohD_A@mail.gmail.com>
Subject: Why it is not sending my simple Mouse
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

https://github.com/vadimgrn/usbip-win2/wiki#ude-driver-list-of-devices-known-to-work

HID_DEVICE_SYSTEM_MOUSE
HID-compliant mouse

i cant understand why it is not sending my mouse through the IP.

it is sending my USB Storage Sandisk,

C:\Program Files\USBip>usbip.exe list -r 192.168.0.124
Exportable USB devices
======================
   1-71    : SanDisk Corp. : unknown product (0781:558a)
           : /dev/bus/usb/001/071
           : (Defined at Interface level) (00/00/00)
           :  0 - Mass Storage/SCSI/Bulk-Only (08/06/50)

but when i connect my mouse

C:\Program Files\USBip>usbip.exe list -r 192.168.0.124

C:\Program Files\USBip>usbip.exe list -r 192.168.0.124

C:\Program Files\USBip>usbip.exe list -r 192.168.0.124

it shows nothing...

can you please help?

