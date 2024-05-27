Return-Path: <linux-usb+bounces-10593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 818048D05A2
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 17:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9821C2144C
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBFF15ECF5;
	Mon, 27 May 2024 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFdEq60L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29E15F309
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821804; cv=none; b=bCcRDDsY35EtkdxSrXw71PxlLUp5yxg3Jywp7NDAhfUkyU7CCgDgb3MNDlRfBWBCZn/o/BiyYdyxY0pLdiORXRc9dfnAonnnW7J8da7Ex8rvwAwsWm7hS88jiBtWKnSlwEMtCBDXAsdKmQ9yXFGqrY+NQnVHLp/ryHIGfN5XJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821804; c=relaxed/simple;
	bh=8euxdJtNInfiUT72I3IcvSXrdjmfBEplPavO12dSkbA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H0Lgb0ib8qzByngjWlxHB/wiy3sURtPAd516QWCYpxJsh0dzUUAcWvW0TtoHNe1rshfsMEIR+ijWU10DYRbYYpms92oAGGrQ22E0gRnQU8/KNOxhX5MQtY9IEWw6WqI1UOLgPRxva23Kj/mK9dBPO2E9m01h23Ie0t7hb8trkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFdEq60L; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5785fc9c543so3374445a12.1
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716821801; x=1717426601; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8euxdJtNInfiUT72I3IcvSXrdjmfBEplPavO12dSkbA=;
        b=bFdEq60LP9vFlyHZlKi+56SdYahsWm2pzJZJ4BDa9MMK4FhjS+qBTKKjF+ELedVZE8
         Ah8dt0zmClfbag8euDUOwfDBb1HLNsIJi8bVNOQZilI2siIP0/oaYJBPACYDq0l+feE5
         kraDyW2G1G8i+fCe2Ue9aVux8d2tCcCVPWvSeeAY7Zq4u0dLY75/4MsS8o8RN1f2Hr22
         OzEY23qnxbzy5+QnaRCLhTgZ+8svamOOyVV5kXb7HEZkc7DyhRn258R87jWjcBFdf3A2
         eyv4opIdIinnBPVicGoqNk0S32E4MjC1f6HFxlNcE2Ff1V+XqgmAkNp4+rl2Q8kWjWWH
         kcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821801; x=1717426601;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8euxdJtNInfiUT72I3IcvSXrdjmfBEplPavO12dSkbA=;
        b=GGCV23s4lN7rVpe9raXbDy+VEyeNlqNj0rJAlM1G8JCiCOENlZAKOxTx6XyiZoZJC8
         NhKVQ75KM8B6W+E1L8JXQIPCj2nN4VjEGH15+BjujeJBIYVlre/FGQCHFT+PpaIYT+zg
         tuG1EH8AHvTCv9WKbiOyFMkofZKQb2nUCoUIf50l8Wwljg8wrBP1NdOhchyQJrs9pErw
         1ILZgHP1Gi0s9DzDPaZkf0FqADDZfsSSbIcSbQBGX5/rM4ysSrKQVljF20nj3EIYX5ca
         Zw0Q6CrCOI4DjMasnicC6ncwKoQ1UVuDrYZLEVNDpT0vto7K2qq/kS/0P3A59v5ewPdp
         ozGg==
X-Gm-Message-State: AOJu0Yy26AOGbCt3AbEEWxbGR1MUNK1+sn9kT9U14Oin9qOlSm+/V9zz
	PsXkOv03eC1QPLap6HJ7LoRpDnop3HaFrv+nkViHlCXpJ2ippY5Vwe3M9bsAUiIRNKyk2C5xbCe
	KB0ItdTQ/jPJvxB0rtx9L6b81lb6OyNl+
X-Google-Smtp-Source: AGHT+IHmkg3W841EGXTm5vBizL2UWu8kEAxCs93BgtpLu/eCUWCd9z6uzdVmRpaIkLMi0Vu8TVEQVqNqJqH0UD52p78=
X-Received: by 2002:a50:c2d2:0:b0:578:42fb:a4d with SMTP id
 4fb4d7f45d1cf-578519aa3ffmr9398941a12.30.1716821801066; Mon, 27 May 2024
 07:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Christoph <chris24.blessing@gmail.com>
Date: Mon, 27 May 2024 16:56:29 +0200
Message-ID: <CABuXUPgdhULDxBLr3GwfFBEqS=HTPSidAPRvkzyBP_AOeTk7eg@mail.gmail.com>
Subject: USB & ethernet stops working after hot-plugging thunderbolt dock
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The USB ports and the ethernet port stop working on my Dell WD19TBS
dock when hot-plugging it into my Dell Latitude 7340. Both work fine
when the laptop boots with them attached.

This happens on kernel version 6.1.90. On versions 6.8.9 and 6.9.0
USB, ethernet and HDMI do not work at all.

The firmware on the laptop and the dock are up to date.

I already created a bug report on Bugzilla [1] about this and was
asked to send the information also here. The report contains
additional info and logs.

Best regards,
Christoph Blessing

[1] https://bugzilla.kernel.org/show_bug.cgi?id=218882

