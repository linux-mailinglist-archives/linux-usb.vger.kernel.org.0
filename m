Return-Path: <linux-usb+bounces-30195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE42C3F91D
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 11:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 987E334DDD3
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 10:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B08831A077;
	Fri,  7 Nov 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BiLLG45/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F36209F5A
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512577; cv=none; b=IqxfXtWm1MtjsF9NQU9QoLXsNJRKMhOqFS6FhD9uQKukP1ISsv67C5hwiOhrasIA2k4pF737JLuB/My0FvQsFxLJTJErbJcQzTq1GaRM/eLrOH8xzbx/fzfXxEWbfFaW/EFw3+g74FRr3Bu9pwKtcwprF98xjgCNYLwHZg0wJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512577; c=relaxed/simple;
	bh=dAsaPC5IxnFMSg7+nhWX4vcS0ecUTFueEx5fAC/E58Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCfPbdGS5pFnI4GbhDVNEoOH1MaC5SevU/12Uw7fYAXW5kx0Sx5Yt6p3pLR3zXBq+ITJoYw66bWIFoDKW+EXc8QBmS33IorXPWni5EJGSF6XWFjCPbmz+3zS4CAz+MXX0ONMY59YxNE3goJZaftG3zGYRi56b2sNVYHoho/jTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BiLLG45/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so526394e87.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 02:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762512573; x=1763117373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAsaPC5IxnFMSg7+nhWX4vcS0ecUTFueEx5fAC/E58Y=;
        b=BiLLG45/lmsEEq2c/OW/B7QpJ7Ge9UE5lAh/xwpwNwBjUBTCM7vnjHum8l/R1lpyc9
         LjC4Rw4xtDrP+0BpdF5QMA704kvapop2vJ7V1pf/fap0J444gc01S5h2WDvrWLzXDqhM
         1/oK6ntuX/qb7CetJgJdE7K12jClWRRnUGrzE+rl3hNPS4EfEUlqcTb93riLREU5+hE/
         hyBbH2ib+HQ7rTnZKTcy24q59+DlJKXZlXQQLFY1oI/e5RchtGCuTDNvMNFu3uV73sVq
         fT6d52+bYg1U5iaRjHbQqZqoBW/cPVND322ZRkx/LBkUNz9QkoxFR4HfbszYm8yz49K6
         ivKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512573; x=1763117373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAsaPC5IxnFMSg7+nhWX4vcS0ecUTFueEx5fAC/E58Y=;
        b=HdJcJg/Y4po+hteqAltrUopol6Cb/GTCjST99hp0kwW9ysrn8Yw7zLLkGLH0XJd4G2
         421o/OH4Weoz4fNl2KdborwfcAWpmMJVcoBvECSoyaHecZwY/NCv0zHPYY7r2L2C9Wwr
         R4T78U6Zpv0mUvSV9xmEGIaBJ++ji6loZs9K/RBDQuyWMabTF1UwHD0iSqXAEZ4f+aQM
         4zaEDbydtke804odDSPgKn8up7WyjnnzikhOxahOhGJbcLAnLZbbK8AC77zAnRVYHlVC
         hsmVaGgr2zQ5sxIQA1nJJ3mQgvt8L4G5TPe7WXROIKc0iqBGvSsxrv0EUZgQ4EIfqPXl
         aS2w==
X-Forwarded-Encrypted: i=1; AJvYcCWJfVGeemM2Xfr1ZpnVxE8iXQlgAM+/q5F/eSZ2AJBOCqxtw/hIR3J9WOcEemHcnVapRD3crgojPpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9iVAcpBrdrbE7zoCOMptrdOKqhq1Qtb7GVgySnEp/o4/SdLe
	nH64o9+Q1MTXoS+GEr/KqBX+eECKLLG/gOA0Q7oFQ9JHl3wOKbuiqZZy2g773QqUKEI7drBpAGz
	5EMl0VEKzak00/g7tlq6A/sCCJGVTQTjtYOpUkCRaXQ==
X-Gm-Gg: ASbGncueSLg3lFKMRUi+kRddW/VPfP8VAThhC1DhVW0/27xN7/wsXEhcnC07FZ4jUy5
	SeotKQxbvOUFngPIifGvy1dWKdN5VOptN4d/TUSk0nLPfgWvkOH3sz9jjrMIm115/+/XgWq8D0H
	xV4H/cYGMjaE0zXfgeBWe0y56b5T4dnyYYyWGdut+0N7+rIW/dOivaM/BdrzcR8PFs55KrU3Pmu
	G4R7s9Wk10WIyndSzs6VKX/fSqeAJK2Nl7b3LdIkiCSCWHn/IfBn+nzCHZaipBFMsMRCKAO9YTP
	NVik2sZtUgulPJOz4A==
X-Google-Smtp-Source: AGHT+IGyEFUxynmzX8HDeXWwOCoTXSc4ibMJkbVABQGK/fWroXf4ieJEv1u4hQVriSfBmzUO7Wua/SSJAXLQ8DN0YF0=
X-Received: by 2002:a05:6512:234a:b0:594:55ab:5800 with SMTP id
 2adb3069b0e04-59456b7f36amr848641e87.30.1762512573203; Fri, 07 Nov 2025
 02:49:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105162736.320591-1-marco.crivellari@suse.com> <20251107094409.GT2912318@black.igk.intel.com>
In-Reply-To: <20251107094409.GT2912318@black.igk.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 7 Nov 2025 11:49:21 +0100
X-Gm-Features: AWmQ_bnDF2CGrMS0S-84Rgvg9q2bOcjihp3igpPRiWrvE0fyOuQiBP0KAZ789xs
Message-ID: <CAAofZF6ohh+5GvXiruLJTNoveydSLDacwyG1ovnuTcVv-+kUOg@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: replace use of system_wq with system_percpu_wq
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 10:44=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>[...]
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
>
> Applied to thunderbolt.git/next, thanks!

Many thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

