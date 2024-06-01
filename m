Return-Path: <linux-usb+bounces-10742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D48D7202
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2024 23:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C3F1C20DCA
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2024 21:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC241DFF8;
	Sat,  1 Jun 2024 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7IXsJfk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC4017BD2
	for <linux-usb@vger.kernel.org>; Sat,  1 Jun 2024 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717277813; cv=none; b=en9Spo0xBdd3qcPmxNdnY1G4FonGuNq9b5y+bT9PDfbsGOH9+2LfqfVnfLSrwdygdLKMIobBZVVvX4I9UyudhnhRJ2/scQpeXPTs3RHi/YWeivx0o880BulXmUyWPqknQPoRS9zdsoI0b6PSbTmJ/t0BL3OyEBcOpoiHdhAsRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717277813; c=relaxed/simple;
	bh=9sQ54Y0mduU3mUCJDUyPDpfT7hRbaJ6j8k1gjYDjfMI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=npZpq86ql0aHYGLqUEcY7qaojS11v+JXgSAjuS65PTm63/GinTCIHKlHZtZiCUMxOr/vgFuhzlMm9PFVneYvFEi7bN1E60TnSRm38dlz/Hq1NmgmpsXS/N3oCJCv1jA55SjYKUMYkwltRrf3ST1fCtnhmdQCWl3ns4ESLxPqzw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7IXsJfk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5295eb47b48so3559010e87.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Jun 2024 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717277809; x=1717882609; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9sQ54Y0mduU3mUCJDUyPDpfT7hRbaJ6j8k1gjYDjfMI=;
        b=V7IXsJfkk7ShDGcsBoBpGCUIdfF3KGgaWYKVEP9k5IPNcyqBg9MixdQl8wCwMAlakT
         CQPVRqNz8Zws4BCDCsET/djmm+pWVdb1JS9CKMOTGhFhLGneFCJnJw/WmhOVkz1/JbII
         +lFyCe9172qLLGc7ScbAPDRoW5WYCjSiqyg0GhNVULCQFSDdl3GFQFGggXOqfD3hHZYx
         sSKxTPb/yexeHwJEnBUnswM1qwWPS9i1a9FiQ2vdGEJoOsIomlKwvnNXeCuk7CAXPL3v
         Mq+bmxr7cO6oh7wTeQ+nJIxjWL464m1qN4HpTprd1BEAX1J2mWTfaNWjYrrcbt8M24vs
         Flqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717277809; x=1717882609;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sQ54Y0mduU3mUCJDUyPDpfT7hRbaJ6j8k1gjYDjfMI=;
        b=ZLDrDqCANKVGFNsgGdxSv/EXQ3tauOZ+RMnQq40M5Y1KiiU2CUJOLD/dgWu7LatNhT
         lfNB1Ihi4kOC8OkhF6c1zpG7dMq85nf43/HVaWUsnzMAH20HU+nZTIvP2LJZSesnZF/t
         JZtF6EReAo6I/zjwm6qGJpDI1bFQdApZqbg90fhQhb4wSxWZBv9POFMPo7Kb/glA3vuQ
         lgUpORltRJyshm1TmoMx1Tof/IA32gHh5thoVolYRENtfuROsmJ7MbgPV/81/mFAsusJ
         NKi9fhIqkc6dIHkPosK9xw2I6rASZVKC+wAd0+tvqHBTWv4/v4YkQDYbwJdtSXy62poi
         e2Wg==
X-Gm-Message-State: AOJu0YxeMBVjEIBqAfuDBHYBClAh39bMow0Pnu1a4ctKYcmhmu4Sa4yn
	ICYvZ0vab53VL/bzf0KK49IGDKan01c7sgNkgA0F3Y8tFmUL38Tqs8/zCM6PHO5ZJIv9dPx1l8e
	FA2EePWtjk1jcGqgLdfCxxNBzAnuJTA==
X-Google-Smtp-Source: AGHT+IEFLwOkQ9fQmWd3RdcGI5kRubfQ32LqybnGBtXHjc7LhLblj1jO3DdkzulbgT38nu0opNo2uU5fPqNhp3aJBks=
X-Received: by 2002:ac2:599a:0:b0:52b:6921:4fd9 with SMTP id
 2adb3069b0e04-52b896c7ab6mr3342987e87.50.1717277809271; Sat, 01 Jun 2024
 14:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: James Dutton <james.dutton@gmail.com>
Date: Sat, 1 Jun 2024 22:36:13 +0100
Message-ID: <CAAMvbhEmLhpOEOegCWkKhEupOsSih2ct-ye7o3m0Sr8+zv=gbg@mail.gmail.com>
Subject: USB-PD protocol
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Is there any way to capture the USB-PD protocol messages on the CC
pins of a usb connection?

I can use "modprobe usbmod" to capture the URB messages.
Is there any way to capture the CC pin messages using in negotiation
power USB-PD.
I guess is association with this, some way of also capturing the
Volts/Current on the Vconn and Vbus pins.

If it helps, my cpu is an AMD 7840, so it will be using whatever USB
hubs come with that.

Kind Regards

James

