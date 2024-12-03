Return-Path: <linux-usb+bounces-18036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3F9E1B57
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 12:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE6C1678D8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 11:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C4C1E47DB;
	Tue,  3 Dec 2024 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mygRsT0g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF121E47B2
	for <linux-usb@vger.kernel.org>; Tue,  3 Dec 2024 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226645; cv=none; b=QcZdrl0AMwzkVv+nBYyC9ea333Rv8HIQvwX0n9JVasF1ADzKeTXTNO+vdwV5qTpf3z1nWY8RVpS7zKG9R0zFLNeDKQG22BYQ4Yuh4gFJDSKLdi80h/8jc0Ld/De3eiJoFN54i98QZUPuroK1eH0O+QZ+b9XrNBfks+tP8VSPi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226645; c=relaxed/simple;
	bh=VmRVHJ89hHaC702KNj5DVwjGknfJqcSrEMUZ3plgFAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+mx1HO3fggjcyLO48gvQk9j61swegVHGRDF3f5KnClJuLDdrCgICyUO4ia0SIwG3cMBCT/us/y81xpwqqnWb7xmz0WEa/Oxpf+Mp18x8oz7c73uUqFkB+BQU7C9ViekfT/a9M8UcYsPqt5BjizrA2FdCAwYiNUrYXe9WrjmZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mygRsT0g; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e38938a55e7so4495693276.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2024 03:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733226643; x=1733831443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFlYiwHjDzAWalA/ssIPWrafHRu3dey++ZE5NO1gWmM=;
        b=mygRsT0gAYQ65F7Nq4GW4iAoPj6H7u+hmFZlJbJmbd6Jr1azQSUP0Ey5E/w0b8wF1o
         ISzUu0xGHVbt/RjudldUIzaW1VXlPPOpgHE0xmQg0ICWKZ/FQ1Hsu8Xdba4SUi0oXPHH
         Dy6UDOV6yURIxFu4urEyVnvA1d/6H9GbekoB+27jEtJmKnX/Bdaztbx16jQAc/RxpwSk
         kqBSIVyg0Mw48Pjf9Db2yEGYrYimWRBOvW4+TUFKEpbIcXHpV8PYjNiYdbjDHB+KXmbo
         Dfsdlp/PAesrcOYnV2RBV4JVjWURpWxyQWq+mOgdxF0gn8W5c9Lf28YnOfl6p7+erzNg
         slQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226643; x=1733831443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFlYiwHjDzAWalA/ssIPWrafHRu3dey++ZE5NO1gWmM=;
        b=KGOrwfKZPwH2ubyw2iJI11Zq3YkE6IhXqi6ebdhFC+kJVxdfIoektxTYpqqQhKpKLk
         5LiQG8/r9A6W1vu7zuke7q5Pn0p7Mqc0jwTjF6qE+B/0/2NAZr3Zi8xOxPN0LoPL/yQW
         w1pZZHxt9B1y2bJg9MsqwqhUTMmlrb5IRxsjYmVIRfKRubINHAp5UASZaAVwupVy6k1P
         IDX2c/zcu902NBx8GLZZcUkA1R8ISm9RnqjNbkW0cIWxmNAswqye6vdG/M7M5wroFeeA
         8COqIywNjF3QP5Q3Rg0m50cgCWJOxymK+kTJpUcDUdjsDEAC1jqPY03X44W8PVcfuknB
         5bFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/hvzrsv/DnU04vUMFg4SSMETTrq+fLZVk+T72nCtgWgvGSF4YpPFeu51IcakTWOnhPg9jNkcQ3tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBcTCoXD1ucOmA9DUBZ1U93nCtyGpZSWpPg5lb1YpdPKhZISj
	8KJQ6+q4gyQk54BkyorV0x0mPhNd8Xyp3+UsDv4wn/7fuiISjlO575sef++GuBDz5JRU4if4WxV
	EUp63EtlRMgFwyvhlXxVq00OyxwP+sgVOTcwODg==
X-Gm-Gg: ASbGncuMI8coZnUsW/sjHtpfHhjScZQQ6YsfD+FCoi1qZm77vOCG2ZyEBhIqA4wd8qm
	0u+pAMxbSV6c2Y8M1UroXj0YyLQjfZg==
X-Google-Smtp-Source: AGHT+IFyTnURgL93B+5dKdQPXnHOV8tQW0IsxTMXNH0c/0ZmEOV3U3JgbfPlCK64NvS19G7Z6OStEBzOxJ2NzXELGWo=
X-Received: by 2002:a05:6902:f89:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e39d3a2a894mr2330987276.16.1733226643017; Tue, 03 Dec 2024
 03:50:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203102318.3386345-1-ukaszb@chromium.org>
In-Reply-To: <20241203102318.3386345-1-ukaszb@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 13:50:34 +0200
Message-ID: <CAA8EJpqnOm0y5T+jAZJGL4FLzUz+jp+_ieaOC4j3av+tHaoJ_Q@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Fix completion notifications
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2024 at 12:23, =C5=81ukasz Bartosik <ukaszb@chromium.org> wro=
te:
>
> OPM                         PPM                         LPM
>  |        1.send cmd         |                           |
>  |-------------------------->|                           |
>  |                           |--                         |
>  |                           |  | 2.set busy bit in CCI  |
>  |                           |<-                         |
>  |      3.notify the OPM     |                           |
>  |<--------------------------|                           |
>  |                           | 4.send cmd to be executed |
>  |                           |-------------------------->|
>  |                           |                           |
>  |                           |      5.cmd completed      |
>  |                           |<--------------------------|
>  |                           |                           |
>  |                           |--                         |
>  |                           |  | 6.set cmd completed    |
>  |                           |<-       bit in CCI        |
>  |                           |                           |
>  |     7.notify the OPM      |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>  |   8.handle notification   |                           |
>  |   from point 3, read CCI  |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>
> When the PPM receives command from the OPM (p.1) it sets the busy bit
> in the CCI (p.2), sends notification to the OPM (p.3) and forwards the
> command to be executed by the LPM (p.4). When the PPM receives command
> completion from the LPM (p.5) it sets command completion bit in the CCI
> (p.6) and sends notification to the OPM (p.7). If command execution by
> the LPM is fast enough then when the OPM starts handling the notification
> from p.3 in p.8 and reads the CCI value it will see command completion bi=
t
> set and will call complete(). Then complete() might be called again when
> the OPM handles notification from p.7.
>
> This fix replaces test_bit() with test_and_clear_bit()
> in ucsi_notify_common() in order to call complete() only
> once per request.
>
> This fix also reinitializes completion variable in
> ucsi_sync_control_common() before a command is sent.

Thank you!

>
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command h=
andling")
> Cc: stable@vger.kernel.org
> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--=20
With best wishes
Dmitry

