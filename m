Return-Path: <linux-usb+bounces-11536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56D911F2B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 10:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 453ED1C22524
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 08:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F716D9AF;
	Fri, 21 Jun 2024 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfn358Yl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9981916D9A5
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718959562; cv=none; b=cCO2f+QtXGqTLGdgFpLUpCbvOWeqSUNK7swdfNYMIZZgp9d5e6F4bsboK/qwJjdtrwVTHrq5IYTF3bWHgpJ7Fqps+oophnD2lFR7Zd4IkYefvFsivW120obalWr6QM/j+hIEaym1ykAGtMn1VvljXVEeQb+F3P7ihasmV7LgmnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718959562; c=relaxed/simple;
	bh=VE21OKDpe3d1pnV0PV8Wr5qGOeSI4in9PC+WG+udgeM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=vD5TFG2jRp9uX4kfWNcfWctWhcoD9wYWininTz2KEDA68cdwVqhmA3KOKNxhUbKqtQEmleVYAUvs/EGNMwDb+QmcuKSRyHc2TAiiPH6KlxhpazVF8u9wq9xfM2cfU06Fw1kRY9Ns2Fcoxi6opm4UyzMqtl/Ei+VHUmQSVNR6x0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfn358Yl; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5bafe063f35so1182856eaf.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718959559; x=1719564359; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VE21OKDpe3d1pnV0PV8Wr5qGOeSI4in9PC+WG+udgeM=;
        b=gfn358YlMMqfom88LiEmLg2YL+x3tKDfkSMtdbohsfviaRI+WBibMMe8TURclr9CDW
         BnkmPJKJWOBS3X8otERGzCEUS3lK1s/S5QXW2NudHwoG6ggQujlfPasjEw9VJgkhYpnp
         GPRXumahLtI9URLqddpfDoYyivyjwEiUJfmbtnB8jMQUGbI2JcqPW68Z2lFhoTglP52q
         W8q+RIjW8ZUxgubLy7LCFp4zxuOUBuZdqSVvYUj5py+P8kKi1z/+SquR12bhPqwIF+Ow
         +icDf9oADA3k0wIU911beIWfClxiKF6AIr+Kqlk0/OBS9ZVgxMU1Z6ASBi0mOU2k4/r7
         lCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959559; x=1719564359;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VE21OKDpe3d1pnV0PV8Wr5qGOeSI4in9PC+WG+udgeM=;
        b=gLd7O8DyIh5/Syueh/yRWYoCBcDPI9TKNf6FfSnecPjN5upsniKCy/ncq5Vgz/WnRh
         6yHwveQghGupcZKjipb97thMj1JPDD/yeEwT+Pqlhqek4ByB1mpohrfWqFQa+fqygxJK
         4xywnf9yq+0u5MmZViXqU77l+84Gu7cQJxbsczgJ7K0mJFU3TEQqWj+SaLiibK1Qmkdx
         VUN1B+5bvPQ8C4t3cRavuOnrdT7ibmJ+WqH2VOL2fNpg/oa0oDf7UeJLZjaM0Mv2WcZK
         4f56klRNdVCEdc/vBadsI+tHT001IU6mcKPiwMfZeY5QE8qgS/X3oTXZRt4sNhElW7wM
         rTGQ==
X-Gm-Message-State: AOJu0YwJ9plal7cqwChWDq6hjd0zLdO0bjvRP1gewObpLpqTFpYS0HBC
	aoMZEq//nMS6jPAn8MZaTKsUQQTFVI/aevmOYPO8Cycamm5wya6ueFSVyc0wGc5wfhKbF1NDYz6
	jEV92h/ZT+qknHqHcS2kNiDbEUvUxHW4O
X-Google-Smtp-Source: AGHT+IGynquk0oIeQ5wmG6NVjUzef19V+1RqrOWCsuxtnxFdhkx4HJdgTe8SQX1uBWoCWy4QkbVxWih6venW0Xcfhfc=
X-Received: by 2002:a05:6870:7b4f:b0:258:37d6:52d6 with SMTP id
 586e51a60fabf-25c94108569mr3667520fac.23.1718959559648; Fri, 21 Jun 2024
 01:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: minh quan le <minhquan07032001@gmail.com>
Date: Fri, 21 Jun 2024 15:45:49 +0700
Message-ID: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>
Subject: Repo: linux-usb-gadgets / ptp-gadget
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux USB Develop Team,

I am trying to use your ptp-gadget repo. I compile and run the ptp.o
file successfully but it shows nothing. I built it on Pi CM4 with a 32
bit Raspbian OS and connected it to my PC. But the PC cannot recognize
Pi as an usb device, I don't know whether it needs a driver and how to
install the driver. In addition, I use Functionfs to create a usb
gadget and mount to it /dev/ptp directory, then run ptp.o.

I hope that you guys could explain to me more about your ptp-gaget
repo and help me resolve the above problem. I am looking forward to
hearing from you guys soon!

Best regards,
Le Minh Quan,
Software Embedded Engineer,
Realtime Robotics Viet Nam.

