Return-Path: <linux-usb+bounces-25939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F06B095F2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 22:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3F8A4396D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 20:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596A822A4D6;
	Thu, 17 Jul 2025 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="blDt1vi7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154CFBF6
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752785345; cv=none; b=ntTz3x7oG3I7wgCANAZLE2UwVHoSV4KvACJi+mO7t6WADUEG2e22gpvkt0tQfyYozMKlir1vSJkMZOaccYHM3Gn88Polwspit00KpjLA0hVmlhTuMemTxaaeJ3gxn5yXUXG3tEjv8r6OAJg8PyARrhqLsjN8gEufOVApL+PQN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752785345; c=relaxed/simple;
	bh=2xMBdTlhXfzMM0SdrIB74fjlsR0n6oCNNxlHrhduyss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMnLyS5BvHNiMinCMEtFcf1OfFrqRulTqLUZKZCn1wtBFetC7oisPgjm5Oi8qsNOJhke3zGLHa8rd2CUEOJkHidktA+3Y8ZxDM7hmLBapj9aedI0bE5KIiuoBAOYIrUpHAcfCuaMTv7u1ZKDlOPaiSPFKNBYXz1AdhXYHiODfpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=blDt1vi7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a46eso880865f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752785342; x=1753390142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xMBdTlhXfzMM0SdrIB74fjlsR0n6oCNNxlHrhduyss=;
        b=blDt1vi7ufzPErqWMRCc1dQ6qsO9k92JpifIIFfaMS+Nsjd/yX2bTZxqK1egdLq1t5
         TJiS2bV9JO8PeSU1OSc10Me1Vxy/PpPR76Jbm5niUvsI5rhp2skP7S+rIlwwJODg7DMe
         0R7gJUuOWIn+BGxaviKWXAQQNC6Cap6i22jWY3XpUcrdjidlV6BfzGTVW4S3c1U5iUbJ
         Avbay1jJeRN32GRKN/DOzue2iezxQmGcGCI3k65ndXJ6o1uMoqExeCYS5dGILz6P1Aj+
         klE0XxGCkIOX7gJOuKCvKa9Fr4u5SEZ6bQyOLc9PtJtOMwzvlYwoiMC9C2XskPxvs4uZ
         bwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752785342; x=1753390142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xMBdTlhXfzMM0SdrIB74fjlsR0n6oCNNxlHrhduyss=;
        b=R3vNOHPLv/D6m8QWMHRQVUIrTqkFsflVvs5VYcpYM06dJClrMV6WE7BR6PXDMhLs02
         MWzS+8C0T5jUd6wraWWVbNY6USBw27cuC+q/SAI+7D6UPtIDVzKIWCV5Al02KTK6zWXO
         vTZSr4agD0587C6EEXZ5bpcX9OxvVZIGjXehh1qw6nMAGFSAwXFj0qYLln+Uq9q1siwH
         JPZoh8Qud9y7PXkIL0BI9oy4OTSmgWbL3Ev321hFbNJqWzTQV4wPbcRZ/Y8QhO+XTkth
         MlDaVsHWEhASMHl4plWFr3o6uRelc8Rh3WMd8OGqjLXP9ha720IJDBBE5MOONP8eD5ry
         +dnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx9Xz0z+ygEzIV4e2l5bjLZzkg3sQoQ70WgX31SkktTEcb87FJGZWlOzKzuIYnX3XJ6X0Hdzn49c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpU7EMQ/b+r8067bcXfS+wdfgi7NRAxYsb49rLbCdx3mg1Z1W
	myxLUDT5dFwXd/LNbcOk3yIsIPW7NARPVb1ICG7MOrKxc2x6uvOFjD7FcEks+FH7FO7GXHQZQe1
	FH5aqAQvcL8o5SEyJ3tJ0g7JD+r3M+TmEyhcfSfVa
X-Gm-Gg: ASbGncvqWRb4v9nhTJTj5zvm5GoelOpyZLInCAWM2rBa44trYQJnlPTZhtOVB25RRFe
	3jnQBCmhEyomfDyuc4ASfShB4s164+0faX+mW1H46wLCpc76shjFd5Uv5R6HHX2ARxd7UJ8p7ri
	bB5s7Jq2E+28A+9vdCDUGyMP7k5j89Py+sYlCrQqRwaEV9VBIkcwQvlX0Cm9+8S6V474O2QIHCT
	YZ4ZQeo95kx7nafALTvP3Pb5oHfBxAL0kHP
X-Google-Smtp-Source: AGHT+IG05BHxfCcSFaBlSf3yYZ+2a8vJjQ7ych6EnDYjMasg/ewCwiiTU4UhqmEkjJjUqI3LOQONogEsmtcleMrfCqI=
X-Received: by 2002:a05:6000:1a8f:b0:3a3:7ba5:93a5 with SMTP id
 ffacd0b85a97d-3b613e779dcmr3366098f8f.26.1752785342299; Thu, 17 Jul 2025
 13:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717200805.3710473-1-bleung@chromium.org>
In-Reply-To: <20250717200805.3710473-1-bleung@chromium.org>
From: Jameson Thies <jthies@google.com>
Date: Thu, 17 Jul 2025 13:48:50 -0700
X-Gm-Features: Ac12FXxMH9xqu2BEZjRqYUrYnuH76YqERP6GzpUcLTWbpebRwCeOsLFOmwCxaos
Message-ID: <CAMFSARe3a+gtsMJzBjpn+1S6jQ3LStWprT599gSN8QxULVmjLA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: psy: Set current max to 100mA for BC
 1.2 and Default
To: Benson Leung <bleung@chromium.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	hansg@kernel.org, sebastian.reichel@collabora.com, 
	dmitry.baryshkov@oss.qualcomm.com, madhu.m@intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 1:08=E2=80=AFPM Benson Leung <bleung@chromium.org> =
wrote:
>
> ucsi_psy_get_current_max would return 0mA as the maximum current if
> UCSI detected a BC or a Default USB Power sporce.
>
> The comment in this function is true that we can't tell the difference
> between DCP/CDP or SDP chargers, but we can guarantee that at least 1-uni=
t
> of USB 1.1/2.0 power is available, which is 100mA, which is a better
> fallback value than 0, which causes some userspaces, including the Chrome=
OS
> power manager, to regard this as a power source that is not providing
> any power.
>
> In reality, 100mA is guaranteed from all sources in these classes.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>

Reviewed-by: Jameson Thies <jthies@google.com>

