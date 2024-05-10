Return-Path: <linux-usb+bounces-10216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B025B8C2AC5
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 21:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E37D1F238CA
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 19:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0A24C637;
	Fri, 10 May 2024 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKu1207C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01948CE0
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370377; cv=none; b=Ho3ZFcagCtjtxBJAfNxxviMUvi1RpGcvo6xUHdt7QcDMuFoETUEoZrnwEbmU/VqkWRCiy1GbWbSaQT119y5KndGIer6ME4jadFVr6DvxR4dxv0gI+z4r06AN2PW4vXIGPvId73iUigTgqhCS/XRcIA9Ggg2BYMgYGgxFLQHOe0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370377; c=relaxed/simple;
	bh=g5kYHFJnjQGsLeTWX/w7fQ5Mz/mRyoUbOgayf2lFI9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0bNTE3tiGCbiuruUzoz2HyHL4O2ViMdUrPiHPTwubvqr5zz2drKxXJzPs8SlV1Xyzggq7DXLnuOs6l3qd4+VbppXgna3FmrblNefwEUOGKfKiVI9ct/ocFpzKM20LO1cYoQnfESeX74WSY5uTO0q5GD2LD2HulzWUCfK1pqrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKu1207C; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso3044a12.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715370374; x=1715975174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5kYHFJnjQGsLeTWX/w7fQ5Mz/mRyoUbOgayf2lFI9I=;
        b=XKu1207CLTpv13BSMASfjIq0j+rPfocvoMqR8wybjCG1jbmu+HfrjldiZhyOWqJ62w
         Bx6URm5ZF2XDauEHQKNOvjaVs8iV81keTJNraBdPFC04NtuvKCnDeQ02Nc13bSOuZGfD
         vuIo8DBJnCxaGY5BAPuMLllkVp28izCBzdKKMzF3qikQR+pE3OH1ZP0UAObwJXkD/iXt
         p8DkJptgfCEt+upZ28T9HDhUvcB7vpZ3Oo+UQldbo/zV/9aSqQDIWyoYEYC37v7kwdZZ
         5KWvPqLOnuf3R7fsu/GMcqM48c3hjGoG5A7OVRf3Qvs9VDje7gcZuedLLhuuh08/8dD6
         aZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715370374; x=1715975174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5kYHFJnjQGsLeTWX/w7fQ5Mz/mRyoUbOgayf2lFI9I=;
        b=Wef0br0P8jtolOxP0bVawYHRzdG8uovAOmcXJQwZeLz9X1VcFP8f1bdCFQptuZ0VvV
         p1fH0ReKSD+WASR06ZdS/0hHfmBV13njggIHD/rNhUObzeAXlQP+V3bufjHvDG/+PJEX
         Pvjx9+TmQ0Y+WQXCgKiCP3PTwBjz5Cw99n7lXndhS9sEYn5uZUH4qN1EDRpqWNaR6pmO
         ro7P+i+mOr62rdpqY4NxwMbE9aoWXsHjn0iKI9U/ciaAKBUNOW+sTD+lF+Z/85mVT9Up
         /YDZK8sRvgilt0wTLaJFp2aAtHOJiDbel0CkhVz3m5B/J69nOFDAfIfgBjk0KIrphx/a
         aFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWIYYtmaSpahIIExSGoL1lkJxviKYk3D4X8mqP7DxBJrMOroJrltZReM74UUAeV178GxVK2QIUxMPHzVPavfckOksN/X5sZAOx
X-Gm-Message-State: AOJu0YwwvNCyhQsb81B9F0AUxkGilZP1MKqKdiYXL9bsYRsska4S/pFH
	hTH4eVbyanydTyjpWk6whESG+SPlqKglk4YgbWLmgtrF+0qToMrUpcHGe59ydMyoVPjEbEBVZbY
	ZT4ouAD2465g1V/ePtCQLj8n6kHUlmvpTbURF
X-Google-Smtp-Source: AGHT+IEjkKKgypzFApgZTL0z6ah3x9iM3bgP7Y8Zn5zYPWt30OoG1qkKTUQ+B4bmehmt0GxsYy1tZ9RDpD4OSamQU4Y=
X-Received: by 2002:a05:6402:907:b0:572:988f:2f38 with SMTP id
 4fb4d7f45d1cf-57443d4d9c7mr27979a12.6.1715370374302; Fri, 10 May 2024
 12:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510184324.2944101-1-jthies@google.com> <20240510184324.2944101-2-jthies@google.com>
In-Reply-To: <20240510184324.2944101-2-jthies@google.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 May 2024 12:46:01 -0700
Message-ID: <CAMFSARcVjCUoGTnNAwy6+RDZ0J6x1hxhVQzdDGOpa0b4cEQJWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] usb: typec: ucsi: Fix null pointer dereference in trace
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hey everyone.
Benson let me know that the submitter should be listed in the last
Signed-off-by line. This is out of order in patch 1/4 and 2/4. My bad,
I'll send out a v5 series fixing this. Sorry about all the email.

Thanks,
Jameson

