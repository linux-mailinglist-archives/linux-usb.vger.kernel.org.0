Return-Path: <linux-usb+bounces-12351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB293A011
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 13:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89971F22CCC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 11:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C837D1509AF;
	Tue, 23 Jul 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6qzX0vG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544A1509B3
	for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734818; cv=none; b=CnFb/UZVMrDQt1+uh8RB+O+f4ALi+hFft+opP2EYyN8ElI7uebD959QfEWkjj8nT92uSsIjxAnNsHFXvaIXZC+Nkzjp1KnJGS9/OAgCO4TXBUqv0Co7xN+L2QXBRf2xSwQSsmcQFef/gcGU6w7jLOccI3fFlHUMgTFGfuVumeTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734818; c=relaxed/simple;
	bh=miKYHhAMQjbYVZWFx6SGlpmuAdTAltRIq0QTKS+3kKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOiyE36InSg6U4DBpCSbAMXTK7obeOaiT/hOzM/LMqDysDhSeaYeD4T8o7hO2xBFFYzoLMHXEVZzHACY2REbFXM06F3s4C7AOJjPjHgkVU6OUD3+S2wfx7y5IS1/dlhhVeFnUfrXJNwrMLnEOb6mkp+0uqFqE73zqwQB9bnuzss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6qzX0vG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-368663d7f80so2874594f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734815; x=1722339615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2gm6usH2cYtHuVw5zQWMSdzPAywa155jTXvnc/dJf0c=;
        b=V6qzX0vGJpv5t+EkELTIH67puz22Zp3up5R4Ol5dYBTU7T1kXE/vmEKzriXqmUjgkM
         LoZzHGZ+6n7jvLRLs43gMIocspCKGCYnEJcNv5Bjn3FLw6UbPbtn/khGFHSXATKa15YS
         k6pvUY/ziddjIO4o/4rbdHkFYmFIEtFfNs5lVvMn+Jo8Dq7Nyi4FE4bWTarGWVph4pHF
         0tNVaRLu2iQnibWWPvLk2WHeU5CLTaslWxBYAJfP9rN3SZZNQ5G2BHOIbmGVupbQLiAh
         QaKbGreiNv3rBbVvQ9XM8CmpB9URl6VwEuLfMuiiXA3LWKUz1UdABoWxYXiVNqU/R03r
         hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734815; x=1722339615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gm6usH2cYtHuVw5zQWMSdzPAywa155jTXvnc/dJf0c=;
        b=oX+zugsmBp5bxQBKz1RuBrgwCvychIiNL13Dk3GizlHn8wFvnUW9hU81CwscpdjIG6
         Y4+96hooVa7y1QL1qQin1BkXdhtqXKgW2Ea3VZwELVUTYKHv1hiTUzcLjV6cL4AcsQJy
         hLWqhLGWRJwh9e7AdvqzPGsumu7u0OWXqvid2SNgOjqt3XTtetFsaOcqffAwv9s2dJRJ
         u+G4+Y5dP3R8jv0bbi7tPn7uWc/Iiz8F0IVMXzzK2F+KcZe3rbVFjhQFcDIl1jLotwx+
         uA1OdXxjc+doOKlKWwUJU+ErzYgv6uBYORvJB/vXnExTcnqRaYHn1SaYfAxgh2ehxIEv
         SQAg==
X-Forwarded-Encrypted: i=1; AJvYcCUE2E9fd3IbswnX4kbq+4NGbs6eRYBLN4BoU5MyqH0hNkiMqqPLZQMhrPvJFy/2lP+5n8VCSyjV8TqXUhMaeoBjo5whRqafw8RA
X-Gm-Message-State: AOJu0YzLtR9wujXco/+7areVmzY59TDLCi+q/n9wN7mGUY/9gLV7S0Ut
	pBxmf8WiAlNPSBk82Zc3MNsvOjbsCDqCXP0tGaFSOZr0ZZWU4A7aN5ysRSmfAYiBEt7Rq0vPyHg
	+
X-Google-Smtp-Source: AGHT+IHT+hdOPzfYwxhYRi+/ggHwAHggwRmVCnpiVqL9zXnxZA6le2MSDka0R2B3RHU/WT8uSRZd4Q==
X-Received: by 2002:a05:6512:3408:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-52ef8db626amr6725987e87.58.1721734804383;
        Tue, 23 Jul 2024 04:40:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5581aefsm1553236e87.309.2024.07.23.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:40:04 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 3/5] clk: qcom: ipq5332: Register
 gcc_qdss_tsctr_clk_src
Message-ID: <vbu5a2z2e3kudfuegidmvhy43tjzcvxjgeuci5gmuwmumqvito@5qbdcpdtduid>
References: <20240723090304.336428-1-quic_varada@quicinc.com>
 <20240723090304.336428-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090304.336428-4-quic_varada@quicinc.com>

On Tue, Jul 23, 2024 at 02:33:02PM GMT, Varadarajan Narayanan wrote:
> gcc_qdss_tsctr_clk_src (enabled in the boot loaders and dependent
> on gpll4_main) was not registered as one of the ipq5332 clocks.
> Hence clk_disable_unused() disabled 'gpll4_main' assuming there
> were no consumers for 'gpll4_main' resulting in system freeze or
> reboots.
> 
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

