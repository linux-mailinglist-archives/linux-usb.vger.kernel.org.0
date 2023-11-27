Return-Path: <linux-usb+bounces-3371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6A7FA695
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 17:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED27E281A1A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EF036AF9;
	Mon, 27 Nov 2023 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEBH7jbC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5766DCE
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 08:34:16 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfd04a6e49so8060835ad.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701102856; x=1701707656; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gxUKtXvFTtxde5Trn8Yvcd1G+tM2Ob+td6M9TUIAd8=;
        b=EEBH7jbC24b8oi2NCDb0Pmjwcl/1ynz3M1bFnvXTQZsP2iIWu5vs1tvo0y431ID384
         E96PCQSpPeS0mhMDvlxjFGqNTs5GGj4XTy8eXvA9ER1VghB0aE++sub9UB6Xpyt6IbQn
         5IkgBHa+Ql7W0jF+HVdITE/KexwngNo7iDOTtcDaEABGzRuiySPaCKn0Yp6ZaVp8czn8
         TMuvewPKtbGdJXksVrLabc8Vr2mxWCnFS1JBWokDso5MfZjchK3ueWkrtczdJrVqbpjx
         t25pG8zQ5NUt1A9CAuzlRLj7Gq+RX/6/YSV2Np//I7qBOFJ75BeI+VBCO32KrYDVvFSb
         zydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102856; x=1701707656;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gxUKtXvFTtxde5Trn8Yvcd1G+tM2Ob+td6M9TUIAd8=;
        b=F7ZeU85/pg6CTi+aGJ6Ft/OLjwVqQb8TklNHSrc/3HlCr6GKVbJ8kjOL6jydpj+ytu
         lLdVg2+D6KAdDAF2F83wVFgg+xOYsxCOFvEF18SxOr3obm3zSPxbo2nQgYwzh+vCpfV9
         qTegERJa1/RJ6vhaXdznv2NGHQSR8Y8Garv1zoO+dLR0UYZZ9fiaaEG1/CXd1zWfmak2
         /WHOqh9A2gg5eeORF703wlkLmp7kUWGVeXGo3CKm6DinjBV1r0TLV08HxJSpm5QHmkrL
         kYBOJIEjD0r/fvV0WX9HgvkitqJz5JfMKm9gxCHhb66aZl9kBOrgLNikic0bocJARiQe
         h+0g==
X-Gm-Message-State: AOJu0Ywbih6RN1TRPZZ3q9B9y0EuL7hFnruoZmB3YjwWQWVsqQfPQnwp
	cpCAAiLPJyu3RuT/cQbav5NsNMGYzzo=
X-Google-Smtp-Source: AGHT+IEzu4msm0Y2jIqYvpHkQfXL4EbmQGTFtfl8IuPoKIPlTQwgSOBBlPKah2Cw4fO1PBYIgpUs/Q==
X-Received: by 2002:a17:902:d2cf:b0:1cf:d8c5:22a8 with SMTP id n15-20020a170902d2cf00b001cfd8c522a8mr2878762plc.21.1701102855486;
        Mon, 27 Nov 2023 08:34:15 -0800 (PST)
Received: from DESKTOP-6F6Q0LF (static-host119-30-85-97.link.net.pk. [119.30.85.97])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001cfa3022adcsm6668812plf.47.2023.11.27.08.34.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 27 Nov 2023 08:34:15 -0800 (PST)
Message-ID: <6564c507.170a0220.97175.f286@mx.google.com>
Date: Mon, 27 Nov 2023 08:34:15 -0800 (PST)
X-Google-Original-Date: 27 Nov 2023 11:34:13 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: marshallbrecken429@gmail.com
To: linux-usb@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ***

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AMarshall Brecken	=0D=0ADreamland Estimation, LL=
C


