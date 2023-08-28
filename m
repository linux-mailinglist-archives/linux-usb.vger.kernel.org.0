Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1101178A959
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 11:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjH1JxC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 05:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjH1Jwo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 05:52:44 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFA9CA
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:52:41 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7815003420so2900894276.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693216360; x=1693821160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4iv/JVooTdRcGn4VXnFzieGpl8nHeZBo/P865iiXNfE=;
        b=KnpkMXApvRWuvHJiqzWW9Vj3gJUs9u0ELfyOpwOxh+0R3fpOC5UACTCVqeRB/C4slC
         RSGd2yzZp2/p9mDcyPp5lLW3V+HS/cxHCSn1heUYFox5MSJmtwmVe7BTgtg+56BEde5L
         JYogENsE+cZd3CCL49s0psjT6w0Vcrmv1aHg4n5EdrIH9XrB4K7jOzTr0A26kvB7dmGI
         dVGax5XV/qeCZcPvUlLaoU4GbVUwnWTub91Li88n5ugu7Cji13HVhiuI0C9wAD/GgswI
         F2N0B+i5ggh0BVMZAJX/8o/ACN4T8MBvaXmdKTYCE1jF51x0+iLf47nKsKRQ0ZLlpYTK
         Zvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693216360; x=1693821160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iv/JVooTdRcGn4VXnFzieGpl8nHeZBo/P865iiXNfE=;
        b=VohOqI3Kd/2vKuEV/WopiBcNLrRnbhI7nrFMSY4Eu2vwXZLpE3Q9KKaktUi0vTUelQ
         ZblZ5jsrNeQ4myJEQbzX301MPm6hkOfHyjtSOaG/xnl6CyqdUR8v+KBZLzvdj2Lx51vT
         ilX8ZDQRthJ0nSoYXoLADv08rDp+SIp5NMsb2qHVo6MDGtP3NLXORkYzkd/AXTV6k6T2
         JRMIJySl9eZzi2Bi7h97awkeParMvaxu4REVwL9U//zVkyJuGUcfvE0l75qmEKBJDW3Q
         fX+n9avKA6zROkOhVU7/8dgLhIvj9JDVHWQygByOOT7kPUS9/bzJ2Xq4o5+SXhvYq7u2
         J8og==
X-Gm-Message-State: AOJu0YxRIE15gQO3rC/wBKWHqN0++QSHyh2kox2ZiZ+dlx6uZlfKyAVx
        nbNJSFkeUkFRZDHCc/+J9ShcHZHfOa5YPYSu6AD2xA==
X-Google-Smtp-Source: AGHT+IFX+udoOeg5/6HAqdhCbZhWEP274z/f9AovSZs427dI6MIQVKDmeIBkpl86fS5i5YExKQoFSo/WKisUqelRNww=
X-Received: by 2002:a25:244e:0:b0:cf2:a664:688e with SMTP id
 k75-20020a25244e000000b00cf2a664688emr25254296ybk.40.1693216360604; Mon, 28
 Aug 2023 02:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230828-qcom-tcpc-v3-1-e95b7afa34d9@quicinc.com> <9a69b3d5-66bd-4085-8b36-2972b06e0a0a@linaro.org>
In-Reply-To: <9a69b3d5-66bd-4085-8b36-2972b06e0a0a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 12:52:29 +0300
Message-ID: <CAA8EJpoputqEhnbonWaHBbLVc-k-FFV6+nUY_2WszhsribDNGA@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: qcom: check regulator enable status before
 disabling it
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     quic_huliu@quicinc.com,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 28 Aug 2023 at 12:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.08.2023 07:16, Hui Liu via B4 Relay wrote:
> > From: Hui Liu <quic_huliu@quicinc.com>
> >
> > Check regulator enable status before disabling it to avoid
> > unbalanced regulator disable warnings.
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> > ---
> > Changes in v3:
> > - Take Bryan's proposal to remove enable/disable operation in pdphy
> > enable and pdphy disable function, then enable regulator in pdphy start
> > function and disable it in pdphy stop function.
> The commit message makes no sense now, it should have been updated
> to reflect what you're doing after the logic had changed.

Not to mention that Reviewed-by and Acked-by tags make little sense
now, as patch contents were heavily modified.

-- 
With best wishes
Dmitry
