Return-Path: <linux-usb+bounces-6900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C250085FD95
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 17:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EC67286D41
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50302153517;
	Thu, 22 Feb 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcPTQnul"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B715351B
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617920; cv=none; b=SCnU9YL+jTp70GWITiAHWcVbzPZzpV1KlQ1i0wtI+Eoy+EalBrewmBNUjL3Uvahi1Gx9PRijLEZyl0QUhySxRmWM+k9Bw6lRpyzdwpfN6Q96/uIjhuPeO5vA8xMN56tSIYMGo9IDE0ZwvcVHXMLTDp+YrJBRC01wYpAQ8xHFH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617920; c=relaxed/simple;
	bh=urvRmO/BB0org3T+bWCoJmBHPVohfg+sLocBgxLbZtk=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=hfn0WRuspzSrdKCJaMyzC08/QtpMdteb4OynRx/my87uqmNpmOfNGTOk5XjB3ZnX1Kj66lbKAMzEqo+5grPO8ICCi/ot/haWGItB7r1KlK0LWgDK/98H74KzFXUMQCg6Asi35ro3cl9SytdfBzCPp8aV322b6UVMQC+GoetlnYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcPTQnul; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so6638660a12.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708617917; x=1709222717; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeKiWniNAHDy2y0S2uIJuqwc541LmuBH8Tb5HcbqtbY=;
        b=jcPTQnulyfk/CEZ7nXnTOtzbWIZi4j+8U7jkPSNOaDq0ILJOWkzmHdNxrOaXSrgixT
         nebS2ztPzTq8CmkR0ed7i/hYZiPWoz226Bulouk7SXBkX1QvW9Gni9RBemur77a/HvUn
         AQzwb1zAU1GsT1BcdPREE6RY/IVQhISeHuNMg9I19KpEuR5c/U+CwiagfJ7SskfeL6ja
         y8HkReHMx50/BCclvpD3Jh0Nq83gbymis9Z9ratCVrxnEfvTD04Tz+OWYGdtrgv0I8Jo
         tV3tHzZTtd7hNurCBPTk9CpxLiU7wLujYLxjZf6jKAp2Lggqmu+xjwiLUpeHt3Lkce6R
         sF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708617917; x=1709222717;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeKiWniNAHDy2y0S2uIJuqwc541LmuBH8Tb5HcbqtbY=;
        b=uHNE9faaU9iX9WJ04yLCwxUALgq1tN0eRCdzzbUSruUcWIGiLhP2VJsHNpzeso5XgF
         Np0m8e+HYba4mOV8s9YInBEbDpkkkax3ZU58zQqDYCPdQjGRQ4FHPyjFPFIsex0dc2/b
         5l+q8XrnzQX1VTZRxt9a28NtlP7mwtWVJkE+TP4XxWDigdfe/iPt82OezNzt3AUs7JBQ
         D0jR+RS3iI0MSzDRg91dEQRW8MMMwwKRYL0YxHhfzTRd8N6z8AQTedUu+3e4GuC7sXug
         tT8PUW5RLNcMeKQAl4pryPKFdemRDugPiWgKtfmYTx6vWtcqHCrCZWZze1mdLqUoQk4S
         Yn5w==
X-Gm-Message-State: AOJu0YyT9lOom117xvDUoDupwzqDIsEbJqQIvwr6HIBZTiSMIBLgzYO5
	IlS2ER9BsCNH280EsSzUeszWSei2EubqGATT8Sp8CFhqwhGG5IsL0E+oGQglY5c=
X-Google-Smtp-Source: AGHT+IHiWQpX89yh6IgW6VhngfJZyfI+vjebVJfR15TCqgIQyExeerQ/kECMn2Tv2N+SW96+9wwNcg==
X-Received: by 2002:a17:906:3c5:b0:a3f:1055:28b7 with SMTP id c5-20020a17090603c500b00a3f105528b7mr5157662eja.63.1708617916890;
        Thu, 22 Feb 2024 08:05:16 -0800 (PST)
Received: from [185.222.58.100] ([185.222.58.100])
        by smtp.gmail.com with ESMTPSA id lx16-20020a170906af1000b00a3e67585addsm4803272ejb.130.2024.02.22.08.05.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Feb 2024 08:05:16 -0800 (PST)
From: Sarenaa Fuller <knufrawsxho7362@gmail.com>
X-Google-Original-From: Sarenaa Fuller <castillom551@outlook.com>
Message-ID: <b2d3cade47addb10d5f41f567e8e84875a9d7c3f7791ee7213a66713f90c3552@mx.google.com>
Reply-To: sarenaa.fuller@outlook.com
To: linux-usb@vger.kernel.org
Subject: Acoustic Instrument
Date: Thu, 22 Feb 2024 17:05:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm offering my late husband's Yamaha Baby Grand Piano to any passionate music enthusiast. Please inform me if you are 
interested or know someone who would appreciate having this instrument.

Thanks,
Sarenaa Fuller

