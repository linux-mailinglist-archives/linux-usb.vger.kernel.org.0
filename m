Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450BB50C03F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 21:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiDVTSS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 15:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiDVTSR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 15:18:17 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35256F6EA8
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 12:04:57 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-e67799d278so5743898fac.11
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U5kbOYIbw9W5idi/w7UWPQThlgNI5YFtm66gzqTVHwI=;
        b=EosFqLT95BxHAVUXgvmDMUV5Lz2xaMtfJWrbZhJGacLzWlPy34JcgfMzn6ruT8Jsx1
         /k/R+WO/a7/sW8WbwMoxUHuURYkIbCwrSeHhuFoEIigjXEhwSnf7lnkTrpCrS9B9b3oE
         tysYeR6jkN+E5fSBIA12eW/xrV9n6zaAKHLeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U5kbOYIbw9W5idi/w7UWPQThlgNI5YFtm66gzqTVHwI=;
        b=ePW+awqWqcbj856gp+LnOhncIAUDVwJFvgqEdiXHyNwSsVyXiH5341LDB7kUvQxmyb
         556oSjd4NOX2jWIMHFAOagK7QfEZJ/7J0sq4wHiKYVqdRHZzHRdFkjpOknTsXBgxvHMO
         Y3TsK5egzt31SqQqPM5NSprqHW6STwKiTbbC35ru2of8RrQAnVkJaVEcTMsq7P35s+HK
         e2IbAdKt8k7JRXRKd4YEaTtdChDngPnHKLRit9Nw6GvTFF5MvekZGSu/1vjmuke0pE/5
         ujQOoKamiQoLWf+V2/fjXpe8ptk0gotPmSk53Pdt5ZonwxRErxLsMfej5RRYAYgwbBW9
         TtlQ==
X-Gm-Message-State: AOAM532AnHz6GBtUABYVnlcs2C3nENr8lZlnXAOH7TN0WYzc5tD2QuOU
        v+6/lkSHKgoBnGSp9LOfLAu9zwX8uN/iAQ==
X-Google-Smtp-Source: ABdhPJzJ07qszw6srRpsPHUiNVf7zbKYzJ5hu40DkMqn2j3wMFLmW5tnu/Ucr3LTdOXuZO2YX+YXlg==
X-Received: by 2002:a17:90a:d0c5:b0:1c9:ec78:18e5 with SMTP id y5-20020a17090ad0c500b001c9ec7818e5mr17636056pjw.53.1650653079678;
        Fri, 22 Apr 2022 11:44:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:404c:8721:29:87a4])
        by smtp.gmail.com with UTF8SMTPSA id ch10-20020a056a00288a00b0050a51a95e91sm3041025pfb.201.2022.04.22.11.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 11:44:38 -0700 (PDT)
Date:   Fri, 22 Apr 2022 11:44:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Linux PM <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com, quic_vpulyala@quicinc.com
Subject: Re: [PATCH v14 2/7] PM / wakeup: Add device_children_wakeup_capable()
Message-ID: <YmL3lMaR79wPMEfY@google.com>
References: <1650395470-31333-1-git-send-email-quic_c_sanm@quicinc.com>
 <1650395470-31333-3-git-send-email-quic_c_sanm@quicinc.com>
 <CAJZ5v0h2ZKPN6SERPnASPywZfeOWXWncJgNZ1WZa80+=M4DCiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h2ZKPN6SERPnASPywZfeOWXWncJgNZ1WZa80+=M4DCiQ@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 01:57:17PM +0200, Rafael J. Wysocki wrote:
> On Tue, Apr 19, 2022 at 9:11 PM Sandeep Maheswaram
> <quic_c_sanm@quicinc.com> wrote:
> >
> > From: Matthias Kaehlcke <mka@chromium.org>
> >
> > Add device_children_wakeup_capable() which checks whether the device itself
> > or one if its descendants is wakeup capable.
> 
> device_wakeup_path() exists for a very similar purpose.
> 
> Is it not usable for whatever you need the new function introduced here?

I wasn't aware of it's function, there are no doc comments and the
name isn't really self explanatory.

In a quick test device_wakeup_path() returned inconsistent values for the
root hub, sometimes true, others false when a wakeup capable USB device was
connected.
