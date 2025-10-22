Return-Path: <linux-usb+bounces-29501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D3BF96DD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 02:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E0244F4162
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 00:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B839F219EB;
	Wed, 22 Oct 2025 00:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ArOB/JiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2917D2
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761091671; cv=none; b=oHk7e2iMRsf1OHhcmuhu/ZfEKQAmglIhPpobXGdKWLMvfCrdKuL1sunz5Hlp3om6WSvVv5o7sD0rYjhj1pjiAKQOw/TSecYaB7jCjk+8ezXu2UrJO1OsavnQCH391/2zasQyqxzVDfeTmtr2XB7sz5xFVJaOrDLWx5sKsluj95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761091671; c=relaxed/simple;
	bh=m4rAzEVY+oK9Rlt9el+kLv1jai8azcglFs+lSP3+LP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUaaz7PJqG1eQRK3PeErbIstzbazzuT8uDbUi8/YY67pxB+h5Rc3wePUKly0ZYo1kjSUd6hiOYztHKkJ8L95hs7hLLqHE2lCg/ndQ9Q/S6Ly0FBFI9JxMin3QFylMU37ePp9OXx5brcljQ64zXWBkyAorz6zgQyarHVRocPJfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ArOB/JiP; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d967b66fedso2048951137.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761091668; x=1761696468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m4rAzEVY+oK9Rlt9el+kLv1jai8azcglFs+lSP3+LP4=;
        b=ArOB/JiPpnduati9J80En2DfivPATFu7VtpXIZLMfBawihioB2cUnGQagP7ru8ErVr
         Uy/xJr+pOcmOiSrn6wMaDP2i9shhLeLG8OP4OECcQAq3tjs08NUG3yD1Rw1ja1z5k4Pd
         obHbX1FEGqs010XfLGFSHwbieKO+SUevDouPlVfTXiyYnIJ4u/rJJF8U4tsNWv1dvpiY
         K6SjW91ko9JwVBGU+FIZ2mNvzEnDO20+hOdYcTPta/aLc6THAV00m1rzwgCuZnMfflY7
         Wet9Tilu9N/ndtpHWjjyOaI2B/+ZPeW2IPbiJkue8FDY+tkXYwFiGrYorNkTxJpuebtf
         8uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761091668; x=1761696468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4rAzEVY+oK9Rlt9el+kLv1jai8azcglFs+lSP3+LP4=;
        b=cHvlZY28YiTTd+ChyaE1Ak5mc6TpfvdDxRKmRQj9ZQTSITVKX0uFimJDA6rcjxJPKz
         Fk7D/VqHD5QJbSmeGcssRbL8WaGs2LF7gYMLbhC4kf1feTVeYaURPz6XeNjaUf1Klkht
         OgF7F6ZP3PUiVeJ97ouu7Dmsk6PtOuitQ2dvPIEyQ5LHHFFvj5aJyDFgrlSmSo1zpp38
         YKEBtSav3iu/huyen+ZbNK0V88ICGZAsYHeNBEa3yEs+JtCyLtFu8HyqCKA+Vubl7m2Z
         KLfbBD7Ku07TF3pgnL38T7mfcMwl/XWQECCPJC9NV96wdgHmexpHpABYmvQLtiqFLR6k
         6BNg==
X-Forwarded-Encrypted: i=1; AJvYcCX0M7Kx2TOgq+Hd+FjUua/+hfTRalZFfPfGorAu6X524beODxM8Dkw+WDiLUlRujV+J6tuQxcA7oTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YycB5U8Wp2zp+mkns+JcPMFVR3ndQXysnluyqxQERdwxS/0/Jnb
	yAHl1wFdHLINQ6oMVCiWey5rmPLtBqMkj9nPfT9Q38Z5enUaSszdsgGRYu/5aWYvKrIctf/YzgX
	9R3Xs923Au4d/fGkq8qP9NUgL9vzr/6GCM07XgBqP
X-Gm-Gg: ASbGnctl2Xzqw/wPl+Kz4aa0pMERZb00R8zHrzIMX+6juyosYhmrl5/JWOL4xHW/A4z
	Y51zoL6ywDWTsxMrhdGI322RggMwNSuUJT/y1/wyv1nj1Sn7+RPE1dUDkVuVtoe6FT72AqMxPP3
	zYwDGp6zV9bM3mHSVR4kBOw++aJitgcYMksW5sDHWUA+rIKE1Veo4zUH1hv3SU1bqWDfIAt8XeQ
	KTEGOeZLybKf+EoIJ94EETe180QAB+KV0cn4tNGIBKXUj1DOvU28X2YnRLE3HYm7V7u3U18TUpD
	XRDMqJazjmqGSikemUOM7mGynQ==
X-Google-Smtp-Source: AGHT+IG7kemkMTF75DLYgBeYC72cxlpVChE2EPbjfTmlF9qvTWS9jzyzy2BE7qmqEqQP1ek6xqr2wkfhFZev/XU0VsM=
X-Received: by 2002:a05:6102:6313:20b0:5d7:de24:4b0d with SMTP id
 ada2fe7eead31-5d7de244f75mr4084318137.3.1761091667997; Tue, 21 Oct 2025
 17:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017223053.2415243-1-jthies@google.com> <2025101839-startup-backwash-3830@gregkh>
In-Reply-To: <2025101839-startup-backwash-3830@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Tue, 21 Oct 2025 17:07:36 -0700
X-Gm-Features: AS18NWDlmX_v61JBT-NlUI9y7JTh8Ff3kMhR4mc9pCwQjIwup5yY3_5Idr-cCDU
Message-ID: <CAMFSARf1Mp5ewJsig5Pv_0n-kEsLq73Nio0i4r8A9YxTCHrJ8A@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: psy: Set max current to zero when disconnected
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, akuchynski@chromium.org, abhishekpandit@chromium.org, 
	sebastian.reichel@collabora.com, kenny@panix.com, linux-pm@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry for the incorrect commit message formatting. I'll resolve this
in a v3 update.

> What prevents this from changing right after checking it?

There is nothing that prevents the connection status from changing
just after this is checked, but that is true of most of the values we
are using to set power supply properties. If there is a connection
change, ucsi_port_psy_changed() will be called from
ucsi_handle_connector_change() in ucsi.c. This then calls
power_supply_changed() which should signal to userspace or other
drivers that this value needs to be reevaluated based on the updated
connector status.

-Jameson

