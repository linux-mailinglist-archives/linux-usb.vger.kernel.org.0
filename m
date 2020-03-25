Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB3E191F4E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 03:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgCYChz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 22:37:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41335 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbgCYChy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 22:37:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id b1so420334pgm.8
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 19:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VRnQilnt07d1oqQ4KQil6Mz63llajYTl97NmNGSglPo=;
        b=YKxyAk3ZQU7yENdjEqMIxZP3xJ5UXORg5Wf994rlklKQNuw65fwL2GtrHKEuOOgQXY
         SByDSi7BXw5nEX22nOtxCwYolWNrZ5/RKwfx7pDywcRUfqxqKfQvMdw+iCUaW+DqXrtU
         WBff/Ecpq8xlXKaDdC+WJaNl9cT7o1158Rv7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VRnQilnt07d1oqQ4KQil6Mz63llajYTl97NmNGSglPo=;
        b=L74yxhfUdskE3CjutIfZr2/p/2Yo9OQg+hEI/eauOApSeHFCMeYxR/WvmcxLizH9uJ
         kHt/Cqu2r9fK6Zkk8KRwfVTvPuHaejC3WcgODVYCivDcK8BlZXWlLgegT8FLReTtC2fn
         tmggzNDL29q0XBUUfpVJfFOfpgbNQcXA56EZ91ESJhNX7e4Hh1q9zFZ61gCrWO7sgxZH
         9LTAcyJYr4IRV/nGcX4tkNJFnY4s9EKDF07Tnl3ImTphfZltHR1Wt+gLUeerX85qcTw+
         RKm7RVJroYbDmAUeLmTHCMtRfht8oPe5isUwEXcoIpzMfS8W21+KyutZlBvWFQeLfyu2
         eFmQ==
X-Gm-Message-State: ANhLgQ0uyss2MFnUPSFZbPKkexSjY1zK8e3pcWjVn+ot4o3n6/Sl4jA5
        fJH2sZEdMgaCyWzroHsPNHdUGg==
X-Google-Smtp-Source: ADFU+vseJ+fw2H4J2gLn7jXALCAM+os616BkOMYNzL7Tq2/7qkx6ZJNgGF+lIAIFjgr8xWMqoG2MaA==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr727458pgb.99.1585103873356;
        Tue, 24 Mar 2020 19:37:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e14sm16965737pfn.196.2020.03.24.19.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 19:37:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
References: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 1/2] docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue, 24 Mar 2020 19:37:51 -0700
Message-ID: <158510387182.125146.16270632251829962912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-03-23 05:25:27)
> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
>=20
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bin=
dings to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
