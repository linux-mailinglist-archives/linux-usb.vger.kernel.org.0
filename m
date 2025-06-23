Return-Path: <linux-usb+bounces-25020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F4AE4E20
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 22:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B12317CDE7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 20:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD712D5439;
	Mon, 23 Jun 2025 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rvirEHzC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D21F5617
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710495; cv=none; b=SvsOh8dM1drGFrg+cWN4fd+oK8ERTIxkusBtYefMAM4ZOY6xLIRSNZ2CXUORXV+fo+NQ3huisKnOmu8hsiPXue6DKi33bFgn5x1pW425/eZZ9+ceFYmmKGPgKhFh7NqJzXyOGZ0K1ohH+ss9Uktued4dALjTOkKtJFtr8vAoriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710495; c=relaxed/simple;
	bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+1/1TI4cQ0Ova9fTM6p2K7Qj1UaaGwH22CHAAx7lWlfL/Phnl64WFGxzWQFyMRXGTqc05jZElT03L4jAOANJiv1a0REYBZjeIjJPhZ4Dy5hcE065HZrAxUtrsf5lrxgYLcQsMyAH6otbQrHXZOzzRbU/1MymVhsJq32kVnmDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rvirEHzC; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81f311a86fso4073832276.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750710493; x=1751315293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
        b=rvirEHzCJq9n/nLdzvypbjt2BTUgMQ2uijeh6dfIKTHdIn9/m+jYZiGFKpxz7EHvCf
         aQmFUBexgB8y4bXfoJncpRyyiCpXvO6/eEsFdr7zow2m9qIZGVMbHx7WJHP0PU0MAvzm
         AcuofpGMBt5OP++xLPNs97jLeqvXlI14WqibOyy8VZt0e43IIj723EXU2mv1JpW5kRGU
         Ny301FxDSO+iTuWG+t4ZmfU307UxrKWiELlrrM3ufTHuNHgTBINvdjPMFugsWhIixJ9V
         lo7+00USAtxzNTShnMG0XpWMHyC9S2rFyKLynJtPkGbHpPH84wR7ZBfE3GGwpRoKMrFN
         Me0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750710493; x=1751315293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFAwq/5YtJXDUS0MzCOwxa42N5UUembrpnZlPw5SCMY=;
        b=qRf+j7rNJrYImjcC0IfDlyQ9828cFzgCDq5+bvxCVWSp1J8wnxKOiWnM1Bi1Uv7nnU
         j1KHY00znOsUrKJTfhgsuseAZ/8cBnyibaw0wtFHnTyfVPNynWwVCFO0hNwZMOtcNBcB
         di5PIujj4XECTi3W8rxrOB9GK1x5J6qSHEPRtggykXK+ozUNSkBoIuhOxPbF2ithknJT
         qMJt8Fyx2B9/kDWl4/OwVf6iHdvlHvztDGKm9jQ6o3YrK+A2ojlrZ76MZzr2zSIVYrfJ
         Anl0K9ujdULtak/bG85WLeAH4zpsVJNFxkYNSvZ01fUMXTEmEDpltc58wz8zLIg3AED7
         jsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXhtaqkDGbchBLQzGiMzCCpMqBt7GcfZ8kiAsPnPGI6/EgRHHVWHzPg9ZPQgGPBhOR1YiPRoPUdS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1Puw8sxJLUcVXDG2Fo4YAkvw/CWw/Vabvqeg2lX8dHL62hOx
	D8fxEFou2JxFexCgbiWa4rKK0lCyHBhCsdljYIkwhsK3+VqzuVEcML8Hgt6w4my0DWqUj3+oQR3
	tV6DfYuJG6a4YGe37eRBpy4xHZ1yJt2Y+6CUpLCtm
X-Gm-Gg: ASbGncsdu6xwF1xr/pmEXBy7rnlxG7hms7oZ2Z9/kOtgpGy0HfHE9QLmhLIx7Z91Jfr
	ZNe+mjmrMHajCSIZ1I3uDnWs48eGz2Gyilf1vrKFkhp4lgTeCe5oEp5XT7EH7cbgyULuu8FTT0X
	Q3KDNpH9JHZmoQGG9J1u7SmrvbojlVU3KFfI5kPorC5BtLA4fJLbZL5aov+VHA6O6/W5imTGRa
X-Google-Smtp-Source: AGHT+IFhn8g/4nll/OHSLozO0+jYdEr+9gcsdRYg0nrp7CATUAdbRTIDFIEiQR8HWAFAUaJK1Lzmnr5wKnr8Pr14jBQ=
X-Received: by 2002:a05:6902:278a:b0:e81:7f36:5a37 with SMTP id
 3f1490d57ef6-e842bc7c261mr16797520276.8.1750710492876; Mon, 23 Jun 2025
 13:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619000343.3299526-2-rdbabiera@google.com> <2025061924-eats-john-8554@gregkh>
In-Reply-To: <2025061924-eats-john-8554@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 23 Jun 2025 13:28:01 -0700
X-Gm-Features: AX0GCFt4xf7IL35aEI_H2kn6Loxq8nJCXegXuTjfSb5pbZqP8I0rGeW6Zg5SKFQ
Message-ID: <CALzBnUEcFrfE7xDkwkTT+XBoxKg=-Z94oDKjO_46n4h6i0VbbQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: add irq_hpd to sysfs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 9:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Didn't checkpatch complain about not needing the {} here?

Surprisingly no, I'll fix it though, sorry about that.

Best,
RD

