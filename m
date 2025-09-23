Return-Path: <linux-usb+bounces-28558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50178B972C0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 20:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001E24C3102
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 18:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D6F2FB084;
	Tue, 23 Sep 2025 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b="YG/4Q99w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7782DF13F
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758651113; cv=none; b=szk52JdsUxS0VFu3QpfXjDTjYRHqF9irmaAPrwHYE7l1PWiMcIaIA6Yu1ulPIjVGGyrPgj2+gIwW8gQwqif4tHIWtBRZ+mR8eMhf0DT/FNafmJzEbP6PxaFEZNTsvmiJqyz13u3BUz8WPRTa7d8IRlWWk3PGmpKh1tCO3mlzz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758651113; c=relaxed/simple;
	bh=QDlBVnoB4CM5JTSiY1jLDynKD3JV/63H9uPWIRUG3d4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Tbl724bUfqhKW6AF2Fj+W952LnISmJuZqUsMfjzyHnYrnE+up8MHvlN663obxDknUj4mkFT4xw1jZgQ3Qi20c9aYI8BVLoFOEicFg0TLgCwOoQV/NYTr4kvgZ/hhsP+bUMgJMktqemEniVW/Nhwv4XRZ8ajyvbJyifkPeEWsh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com; spf=pass smtp.mailfrom=it-loops.com; dkim=fail (0-bit key) header.d=it-loops.com header.i=@it-loops.com header.b=YG/4Q99w reason="key not found in DNS"; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=it-loops.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=it-loops.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fc14af3fbso9564337a12.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 11:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=it-loops.com; s=google; t=1758651109; x=1759255909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VnHPJBSMey81dJkiaCxtf0t9jn4b7s6SnvdS8v33rK4=;
        b=YG/4Q99wpotTkKvxTNig3Nae6P7AvBrm3gaNlSS2t3XOfXXWZitwvhUzWEMMUuI3DD
         1OqQHx6b71/A6kONd0g8esBFdPobzdLuMT1s61vbD3+oEasT3SucEBIiw/QPiRUi5R3s
         qofV5MhbwMs6tw2xwHa0uneHh1GjgDP31I7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758651109; x=1759255909;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VnHPJBSMey81dJkiaCxtf0t9jn4b7s6SnvdS8v33rK4=;
        b=IOFGkwl0k8mAkU1n/Pe5pfdGYnaAlsOXdtWRfl2/m7KyCry7VvmwW0B0HW+zHtrLWX
         NC37omXQo970EPhKpe+bu3A+VlkEdbFsfTpR5Tk50uyrxgyapBUZ/24F3uxeyNao8xZD
         uVd/s3LY7vXVsGQv7PBaSFZG920Ocrx0KDH33ezdry5hP4iKUIhb9CSeFWcvWKzuWxy3
         P3Cxn7rZJOhijZAOnxtIGdQwdEdpNEAXLPxeQlrQX4RuxocH6XMqd/aMBsyl18CltMsx
         zgmIXNh+g9+rT4W1LW6SpG3VXE835vrCCXhfdyq7Pjk0Jq2J18Srel9VXrxmcWiU17F6
         Fjpg==
X-Gm-Message-State: AOJu0Yxm6EmXfnWujKYdeA46POPIVONNr2seuQPRDaqKDI8g+NDozlVK
	eKDoZN7cxGNmQVdW7Yte801Z8FfzKqdwPBV5hm899XVz89nllM8q/QX+TSPHGL9dxiKQgXzSWG+
	FVxEZTd75P+SmeVSj9MYEEy1y0aGMLZFaQc4SMH50PGA+gpC7yc//
X-Gm-Gg: ASbGncu0mAhxFdb9tcAIia6a6krpRuVVbZnLKzuSeupaxzyv0hukVHWGkGHvUfRiX56
	3TKyFompZMPdfyFZEjRarSZMjQcOM9DyF9kC/qsdL6eEwCU4jv2qX13V1e98iGXR5ZDUCjNWG2l
	0Yg3xWCTWxBleY7/4cLDVrnPLs3+mH6kc1npKwRgOeNE31341LYULDXwxaTd6G4jvJazEtCjhtu
	9gfSV7z
X-Google-Smtp-Source: AGHT+IFlff0OjRbWwhve+lv620kukIhDtYVui64wrZW5ub86wOdBCKuhPgzDaDXyvnIWnrZ9KXu06HO6EHtf8RaYMDc=
X-Received: by 2002:a05:6402:2343:b0:62f:36bb:d8ba with SMTP id
 4fb4d7f45d1cf-634677e7c9amr3086889a12.22.1758651109328; Tue, 23 Sep 2025
 11:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Guntsche <michael.guntsche@it-loops.com>
Date: Tue, 23 Sep 2025 20:11:38 +0200
X-Gm-Features: AS18NWB0GHTVwI61sWmawNs5gEuVX7Mh23_ED6tdleeVLKoksLfQstoY29Js4TM
Message-ID: <CALG0vJtX5EdNYJ6=Fiz=uiAN6ur=BDj39UpYnj0OWSSLQdDgxg@mail.gmail.com>
Subject: Re: Kernel panic after return from hibernate if thunderbolt state change
To: Michael Guntsche <michael.guntsche@it-loops.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I can still reproduce this issue with kernel 6.16.8 and another
thunderbolt dock. After resuming I more or less always, with a few
exceptions get a kernel panic.
On the screen I see that the image is read from swap then the last
message  is somethin along the line of "shutting down console" after
thata the screen goes black and the capslock key starts blinking.
Going back to a 6.14 kernel seems to solve the problem, or it just
happens less often.
Since

