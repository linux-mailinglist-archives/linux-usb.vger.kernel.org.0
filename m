Return-Path: <linux-usb+bounces-8190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F388874D9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 23:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D66D1C2181D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 22:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C51280628;
	Fri, 22 Mar 2024 22:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QegqF2HL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D088823DB
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711146733; cv=none; b=e+u7qzM3F1F/ilpmhcJ01zjRBY57vNFShN1h5dRFvfh6N32kTqhswt7DqFkwy2dy/NfmT1TurxCLRxu9BbR5TCjd9F9AoGJ7QRXubYb8b70GxeGtTBWlLjA1sL03emYbYucJSauaa9QP9lfmqr5ncjx5677aioYFbeLugU8iQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711146733; c=relaxed/simple;
	bh=SqoB37OT1HojDKRhowyuuzQ4ERbxzLBp6bj9r5cbVYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeemNvVg5HBwz3eF8gSDCJbP9ZZjUEVoOJpu1Dj6WWUGwUGgmpmA/Ujw6O5vZ1yqYxP7zL3imDKbKLtSADFJ7yinqtbX3mfWbRFpggTniuX7NS1tOc3omO8iMqtGnob6ri07B2v6prEWrEurtjk8FGZE83+lXq+dCvNOtaoaGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QegqF2HL; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2610581276.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711146730; x=1711751530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1a5pzjd5I8Z/mJlSaH96qG0n7ip9wTr8Kfl87ju9Mw=;
        b=QegqF2HLN8XPZETmZCUND1lYGIhpClbZxuugg2tI6vvE6qnzi4NNLdlX2X7Xp2QgMZ
         VyYbaxx+Vqd7ErgAvPqNsnS2pRYBblWEZeF+2WrJA+PQn46Pu4Gxo25fECJQbiKGz1L8
         iBQINq5C5oHB17e7VXI5bCLhozJ4lba2RjhZ2CjAInlGGJLqVEXpJBRAlpDyU0B2Vm24
         3dr99q7+nh23HjzzIkttiMs+x7XgwI00sX15+sn1CH3iduIwfz957j9e1KC15BmZl9I2
         AGcPy63KaBBV8YyH0hSNdS8/WX7AXKGeuNlviA8Rgy6zJoBiNrHLrrJxjpuiVvrEDiaf
         j7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711146730; x=1711751530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1a5pzjd5I8Z/mJlSaH96qG0n7ip9wTr8Kfl87ju9Mw=;
        b=LKP5YzzGIZWPhG+jyx9D1bHZ1UUt9lFRM/AL2yGpjJE+YPfx02BJDxOo+5DT+kov8J
         2/8OtYd4OrK2oJzQUPQVOJF91v66fqqTjpsH9gKEcV7sRRs8bItWqKH0zMvaxPoPodvF
         KE+NNErgObgf/bcTgRtL5hUS08JpmiWEtFchhYiKXvYH07B5eVtEhbS0Zz699nPRHmLO
         BRIhmVmgXqdA6tGoiwu8KJA2doOQOCvQkrLzQWRm3O4lx5BOe9JnkjWhpd2G4UOfrIWS
         msmx05IGxrM3PVxbFKZw93JFfBnDe8ABGR7xZxBYYHBDHw8kK9KHiwQ6ccXAgj3YaLfM
         53Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVxQtPzfJWD7Sk/gltQ+mmRk/ALvHuxJ6p0Q2isrLVnI5MRp0Delj9sfXRXvKmeCrEOs3nrp7wjd3NKKcMwXA0l4dSi3aCO/RWF
X-Gm-Message-State: AOJu0Yw6dfkHQjpPlQh6X4gb3w+FE9sOJNizdnBZ6gJdJUsWxvllwe/5
	RATqyp6RF4P2BC5jDa/1TMXETJQN8+asiSI7wHV8uoQIY7CzWo4B72TL3zMGoS7x7Ng3PamOLkG
	HZkFWfX9KiEhdCJ9dmFqhoOCLaKA3Df+9BRb79Q==
X-Google-Smtp-Source: AGHT+IGLQFN+Cx2L6/BR6lRV32tv9zuTfkKLRJ9nOBrx94hSRHDg6IOx4CBERz5ZDrf0Vc5gYEkGqgbLxSkOYOtCH9M=
X-Received: by 2002:a25:84ca:0:b0:dc6:e4f8:7e22 with SMTP id
 x10-20020a2584ca000000b00dc6e4f87e22mr651683ybm.62.1711146730353; Fri, 22 Mar
 2024 15:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org> <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
 <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
 <5ea4a187-1971-4970-a289-826d96c0351a@linaro.org> <c0f1e898-7638-4b7b-a938-9e31e5b57e57@linaro.org>
 <0b091595-1587-421d-bb00-c00ef729d143@linaro.org> <CAA8EJpqvwhafFoD_=GO4E93JBQA2A+xY0rG14pgPm=xgJ9Yz_Q@mail.gmail.com>
 <7cd6768d-780c-4cdb-8091-c7a161eab23e@linaro.org>
In-Reply-To: <7cd6768d-780c-4cdb-8091-c7a161eab23e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:31:58 +0200
Message-ID: <CAA8EJpoDZ0cQmKk=MBbQf446PXZf2-93Ne121osyUGRvABoing@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port description
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 22:44, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/03/2024 15:49, Dmitry Baryshkov wrote:
> > It's true that we don't describe CC lines. However In most of the
> > cases CC lines are handled by the Type-C port manager directly. So
> > there will be a connection from usb-c-connector to the pmic-typec
> > itself (which looks pretty redundant).
>
> I think it more logical to associate the role-switch event with the CC
> lines which actually handle the messaging than the HS PHY which does not
> to be honest.
>
> If we predicate a name change on fixing the namespace then we should fix
> the namespace instead of reuse existing for expediency.

It's not an HS PHY. It is an HS host  = DWC3. Anyway, CC lines do not
go to the DWC3. They go directly to the PMIC.

-- 
With best wishes
Dmitry

