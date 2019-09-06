Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412B5AC18C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 22:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388847AbfIFUk1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 16:40:27 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37766 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731921AbfIFUk1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 16:40:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so2608223pfo.4
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 13:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=swYhYhOrQirWfGuJUy4F9KFt5Sj0aaeo1T8GuTEGiz4=;
        b=XNQZCDL1t7yoNNof+dtO6sm/fp+82jF9Dd+D/rQFYDJcBz/L2D1KGp8OUyEU0c8k6x
         zUnkoplE8fEg02iv67iCnBKbzlwLAmDwz94XsxzsIa6ZQJY3xQWrtMdBLejK8GkIowW/
         32OdRNGIdjSw6kW2kVX9y36xYaVXLtm9SM/yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=swYhYhOrQirWfGuJUy4F9KFt5Sj0aaeo1T8GuTEGiz4=;
        b=r7Uch3EJF42eeIy42lQfB5XVlEfDTvkROxX/tiFTzgQ7/mRVk00yrKTNYB2BjPaaT/
         ZeixzNZvoSvDbJicuIyMiHqH5lL05sLw0J8mA3uhRoJ01/HznRyFtFcbpwF5LAW4kmsd
         /XIRYPjDZoifYabVQEBliadQLCenVlngIe2D25EIbjHv6Kyrob+iUoUsb1IOte8tu67Y
         HsdpTIS/Fsd9RrM/uPka217IYj01XPtZoYnCXTNqE+UQFSw56T889xiqKzD/eRTDQMRG
         sRa3GizIX72ouEybzzMCu5Tw9mM7wHt0Ch/Fq97DJqKqkg41Q8f022xbKPReasfbyc7H
         K8MQ==
X-Gm-Message-State: APjAAAVSEpOuNO2gjxytMFVNADg5Jdw2sa/fv2N5e0dE5fuJ4kohUhcx
        0NAM/RbzuxX1Zexzo6UIx3O4gg==
X-Google-Smtp-Source: APXvYqw1lGijoxS5N/LyWFNhxa8KAKbm6+WK8DHVTDzRzO5NwdkiAeKIWg805Ebt+vzKg3H6r2nBUQ==
X-Received: by 2002:a17:90a:b383:: with SMTP id e3mr11866956pjr.85.1567802426141;
        Fri, 06 Sep 2019 13:40:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 2sm13930134pfa.43.2019.09.06.13.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 13:40:25 -0700 (PDT)
Message-ID: <5d72c439.1c69fb81.484c6.fe28@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190906182530.GD11938@tuxbook-pro>
References: <5d694878.1c69fb81.5f13b.ec4f@mx.google.com> <5d696ad2.1c69fb81.977ea.39e5@mx.google.com> <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org> <20190903173924.GB9754@jackp-linux.qualcomm.com> <5d6edee5.1c69fb81.a3896.1d05@mx.google.com> <20190903233410.GQ26807@tuxbook-pro> <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org> <20190905175802.GA19599@jackp-linux.qualcomm.com> <5d71edf5.1c69fb81.1f307.fdd6@mx.google.com> <20190906182530.GD11938@tuxbook-pro>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 13:40:24 -0700
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Bjorn Andersson (2019-09-06 11:25:30)
> On Thu 05 Sep 22:26 PDT 2019, Stephen Boyd wrote:
>=20
> >=20
> > Yes this looks like the approach that should be taken. One question
> > though, is this a micro-b connector or a type-c connector on the board?
> > I thought it was a type-c, so then this USB gpio based connection driver
> > isn't an exact fit?
> >=20
>=20
> For this particular case it's a type c connector, but the port
> controller is operated completely passively (and there's no PD or DP
> involved), so the GPIO based approach seems like a good fit.
>=20

OK. Perhaps the binding needs an update then to have another compatible
string indicating type-c connector that's not able to support PD or DP?

