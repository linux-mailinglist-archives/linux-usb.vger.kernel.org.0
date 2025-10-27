Return-Path: <linux-usb+bounces-29696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCBC0EC8B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 16:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 245FD346866
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 15:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CD7309EFB;
	Mon, 27 Oct 2025 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7sz46gr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCFE308F13
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577433; cv=none; b=BWV/9ig+ZA4kOGW3FIH5SSTwLRzpgRLY6wUgeiUuf5jOOGuiNNM+zNNu484oZjQMLo/4jRPFt6ZJqQd/lvWxJ6PwIOdlo2l5YVnQcWaHpKeozQlhhRTYjlo1CHxEZEFhgGGyPKAnjp4Kh5z/GbWfYWBFIQO3dxYp9nFG/WyQfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577433; c=relaxed/simple;
	bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke8ASJ2BMiq9AGcm15dYMgBx0x5mxrt7QARM0prE36a7ubkhA2mdq0snnJv0n8u/zu0ymrpfN0cY9Lv1aZdmmWLl52M+CvOwfeEg3gPoq3hAJyT457cPf9g1VGU0Kk7rr+jfcbU8v8wHOHYV9FU3+0G1huW3QpP2b20rT7wnRBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7sz46gr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27eca7297a7so5134115ad.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761577430; x=1762182230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
        b=c7sz46gr4+YycFkdy/j0lqWIvOfwCpQ4BWDfxngD5onKVM7eGvmHHObvWDG+9fzKpv
         qyUYtoISQeR5Qpui5dfGnzQz8FfBAbphMAK0M4wWgXOgEpXN2S4Qq/o7aF7HwG0i+Kgw
         fCjMYC6Sxi9XaRtKrsJCKshCql3ZZ5V+u4LFW7b/KvRcrXiOAe8d1iiMoXnd8og8lfoe
         ZBeDEzkErnbxf4gDDsrVhojgdNOLCxstVaYk8YPyCBJQq2o1irYNwGOhUAI2DBCB8kMo
         BKrO5GONf9QhGfRAUvMpzUvW4YR7LmrbKFKcAAcDM2Q5MOK3aCsWcKX6VNnvDzgZlz//
         wnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577431; x=1762182231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DApS4hcsGD3zyYGWIsdcOdWVaOZg+1nVqfikxiXnXSk=;
        b=A7euhZKnnswtsfr4jT4ComPIpw3J1HaNvnB2MqnU+699XQHZPfeP36J0pgiEDMHJB5
         kdqkVC5NbRbCuPsjU112FPMQ9znSzWxOEemiQmBuf6sy78xc/zP/jAxRX3WXCcRv1RGB
         1vXl3Bdka4Ev5+FUFVl5B/tPi0Omj3tuLw4cPsYL3PKVPtLpY0Iavf+iLI49BL619QfV
         Dou+myIoPbnQeABxYPqlDf8/kbgNQGm3T/LbNV7SYzHYP89fQFu0tea3ijumWok9nom3
         1n+VTbPwE5N6Grh+b/YxsI7hQFgzYI/IePUBlRxhEkqgamEmLETBuQcsC41g1W2inLDb
         kx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCURyDPPhBcJPfIQ+4mE1aaD3M13eHld39Db1rbzl+R0DOg9yO3ztg4v93cBl3ZKN55bOL3R6+OnckM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMs8gKiHh4w57g3RbBBsRzYvnflSYh2IjWnyf3CgC+YQ4MZwRw
	AP5sWYfCfbqvUuTc4Pg5Lf64SkmPB3810n5HTtS2KGercNO98X0D0czXlr3aDxQ9XmtZXc0LgHo
	F4Eq5qrmTaIp4bqodPV7w1JBMvfUFDFQ=
X-Gm-Gg: ASbGncuTEAjSQTppRWWjIaFWj91+yivbfFsFH3MwtaBgonSA0LJ9Yy3A1h31PfQ1zeJ
	epikjg2pce6x23FxXY5r87iPkh+sCdR/SHrNvJhwIB3E38FhfH5ahHOZPEVAoseumilJ3XA3RjN
	/gy6GdnerQBRv/7oL5yU6YgfDlHDMuglFrlaWXSyTqwyP7kkrvUMu0CNxoODxEMVZhOxFimNw+5
	z6mSWXpPnMXPIZHGPpldjeKsDtTyAx5kX+6hVMSHyP6wKaMvl/sogxnMGuywLDfPDlsQ1w+c64u
	mU4JJ82Alxy/P81d73qhy6ecq+cgrCwtgnmvJzaEKHGN5Ho28BpygyqOvpMt2oIEmYmqDKYS5Xe
	8mi0=
X-Google-Smtp-Source: AGHT+IHZ0l03J1yw11Ees0ZvURyj2fdVG9g7KrsSHbaLFL6bHoHKGgLcoCtIOomRh9t9yoDHMruQdA66vlTUVakQCeM=
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr1426145ad.4.1761577430243; Mon, 27 Oct 2025
 08:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016231350.1418501-1-ojeda@kernel.org> <2025101758-mystified-prideful-8016@gregkh>
 <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
In-Reply-To: <CANiq72nXw4+HesrgNqJjTy6Ji=pVqUMzx7GDO+6U9VYWezTt6Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Oct 2025 16:03:37 +0100
X-Gm-Features: AWmQ_bn7EsgCH1WfjYQWlmM5ETWJvrKP7qcsX_xSwmLv67g4Qr7Fxq14134xbNs
Message-ID: <CANiq72kn9HZy2kYaGHM9yj2nR+SAQ=J=Oh8k2doPFMDCRy1wBA@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix formatting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, linux-usb@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 8:59=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> They landed in mainline, so Linus' tree is again `rustfmt`-clean.

Pinging about this one so that it is not forgotten. It is the only
missing thing so that linux-next is clean again like Linus'.

Thanks!

Cheers,
Miguel

