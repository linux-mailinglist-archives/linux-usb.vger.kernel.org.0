Return-Path: <linux-usb+bounces-7356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA086D0A8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 18:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AACF1F252C4
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 17:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8A170AD1;
	Thu, 29 Feb 2024 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIWzR7pm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A556CC02
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227761; cv=none; b=bXrPX8ayEdbsHBLdQIrRE7lf6PrtxVKSZQJNPfd3fz6MbF8Me4OBM+MJKlkWjPwjhE2P93o1XBJ+MukO/CUuooQQOWpS6ypGmRNDNALqEZWgfqLyY93Zm9He98CpcZIWSkxelaP++q4AnzhPnwuAAfFftjtFZfTG5ZGJkdrDJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227761; c=relaxed/simple;
	bh=qiKlw0OhSDGen17hCQcELURBTIFGPtqOevn9pJuQZCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+neA2HQO9D++tbN65dj/FkRv+Wyl5jaA/C6VRAMz6S+47f9ujqc3mmbUAvyjLJV9osesL6tMJ827FPseKZUvfvilliYxwcWUGz61PcQXaySaNrK8VE4LGOfRz+8TuCCH9UBJaxjyZWnWNgX59IVmZNkJilTCIP/AEI/OJAzL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIWzR7pm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566b160f6eeso7939a12.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709227758; x=1709832558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qiKlw0OhSDGen17hCQcELURBTIFGPtqOevn9pJuQZCM=;
        b=SIWzR7pmXsQs9hF5eLjqKaUUg1S2iT2wGz4zHhvAuPtmkWyl89pHA++0urCuyLCinZ
         EdM+LSX2n2JtcFFxfOHpB2ORMKOdi7ceQtf9TbE2aKB+STOa2dpbCumXjxyDLBNaXHjB
         q7fsjy6R1MAvQmEWWzzdDiXQKGxulXgGbWJ2KJqvatbRLU2bZHXPOzbuppTCC1kcqP8E
         zj71CUTgq/lAFkfd4T1hFJ7tSggnCZLuVUOZK7XCPy+oY5tHG1GcrN89Hum2hy/7KbaN
         I73o48o7YEKkQbEcRVSAyLsUgArrBMXIS5Z1uHh9DqJgdE5BRxr0tO7LH5jeoqj6r8Df
         JveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709227758; x=1709832558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiKlw0OhSDGen17hCQcELURBTIFGPtqOevn9pJuQZCM=;
        b=cOM/4Ap8TKzb6yeI+XMzf6ncrBYnO/voxKydVfRRU6QHiFNWuBm28exHDB/lEiXmln
         ClG+39+MRd/OZVpTzvl4bZw4898wVPL/sz6ji4djYlPXTrhZK6iRXFj8TSvYXVg+3U3A
         TVozU3g17dEvwV+V+/4eu70XQaaqggR5aPgPVnwNINVQ/MEcdl1GSskNlwgCzjVXJKvW
         pbp2rOjBPmdqGXYut/o/7D3LPeLpbespYkB1LOpAigfbT7PCWbyJX0dD4Q92ksrSBmJY
         55jANkxPXBTBPfY/ZhKScRFaXDRNPCvE39Ond5gREgFbAa4bGQkntL+ytH8lMEjKKP9g
         IRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU080ANIdPhaGYJxLvdbU1UhEWW+SLOK0LyqwzxSJMBdtYRUjJLLO7fp5Gj+eGHfGKC+NEdn5X/RhWWS9BeaEQIRm2S8oLxT23f
X-Gm-Message-State: AOJu0Yytr9Of3IeOKAWCf6KlNTX0hkTwBJTsxcmKk1xqbTtpnwa9r7my
	Jw/1drhrI98ThxaGRJG4oS3qwqJvL3tn2DQwP9BU7Di3bwADgizEU86qc9NPKajIPUL5Ny+OATP
	F5ZsUOz2lfy+0Zrl7WLtpPIbJ5C6+7QlJRgjf
X-Google-Smtp-Source: AGHT+IH2ofv9FFmNmhdj/g9k2GUUh2LuNtRa7jT11VzniuW5WtsWSzB1jGMqvwIIbN3OfA25EEztX/E1Lq05ofnnLMc=
X-Received: by 2002:a05:6402:452:b0:562:9d2:8857 with SMTP id
 p18-20020a056402045200b0056209d28857mr166712edw.6.1709227758081; Thu, 29 Feb
 2024 09:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229015221.3668955-1-jthies@google.com> <2024022923-disloyal-tactless-09ca@gregkh>
In-Reply-To: <2024022923-disloyal-tactless-09ca@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Thu, 29 Feb 2024 09:29:06 -0800
Message-ID: <CAMFSARd-ri3ngrfXcj9e+AaM_1F5VFpbCqukDLgwxQrUX5B88w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
sorry about the confusing emails. The most recent "--no-thread" patch
was intended to be the correct one. I'll resend the v3 series with proper
threading.

Thanks,
Jameson

