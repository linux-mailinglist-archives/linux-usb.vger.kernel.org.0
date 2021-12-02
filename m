Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD46466D47
	for <lists+linux-usb@lfdr.de>; Thu,  2 Dec 2021 23:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349258AbhLBWzd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 17:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349268AbhLBWzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 17:55:31 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B02C061758
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 14:52:07 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id r26so2157207oiw.5
        for <linux-usb@vger.kernel.org>; Thu, 02 Dec 2021 14:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=cfV3qg4oBLPqiJvstuUh6sCTl21EzBS3ZB0AYx6oAIw=;
        b=oCLaCiPlPHluuvwBPceP4jp6yR/9kzKZ/y/soX5z3lozDD5OsmgrwYMJYlaLjk0QNi
         wWqltQCm2vvPwkdrgaXDrNSgb7Ofe4ZitK/45FkNuC8QsCXYt6nlYLoF5pGQvZWlVOIN
         g8w3fPBfSbwwRI4Ub29HLI3Dmd1g+AsVAtpZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=cfV3qg4oBLPqiJvstuUh6sCTl21EzBS3ZB0AYx6oAIw=;
        b=bqEEVQBasW5LXo62FfBrAat9JjEZ1ty2AR4J59XfecYLEDj27mAypkZ0TzdHOu9DBM
         FlguGHJ6LkZio8wgnJ9RwDgGetGsRB14vs7BSrilQsevHMdeuUQE5TA1dPtnYfvYDNqG
         CPwFkfNWgBZpFcOOkU0wbNZi7OVX1pCRgJyTNXypGGOTm6kYc/nkffd9PwubMNeuXAEM
         2zs+xV0jIb+aTdUO1JfogrR7RrOpcQtFK++QIItSLmaXz2Od6fME3/ScfMnZItC/NuSt
         gieVdDZ5PRzWIflimHgkH/4fxyxOu3vcDst17Ivw99A+mM7SQY6CoB9ZCSBlhOSsEcc1
         cgWQ==
X-Gm-Message-State: AOAM5334HT4tXkGlmFTgvKke3QN/WVkbGbV+uNMg81Rpm3Yhh4dzQgAj
        v1rajOALb4MNCRJNwRW6Oer56x5d3AaCpD6PPbaxOA==
X-Google-Smtp-Source: ABdhPJxmpZMi8ld8EOJe3uC13tQePFO3Hrs3yHTyYht4szxr7NKf2KIPW66DJ0iP/ooEHw55GDJoy07pmkiC9exiNuI=
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr6743963oiw.64.1638485526978;
 Thu, 02 Dec 2021 14:52:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 14:52:06 -0800
MIME-Version: 1.0
In-Reply-To: <1638422248-24221-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1638422248-24221-1-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 2 Dec 2021 14:52:06 -0800
Message-ID: <CAE-0n51S7gPnkgL40Lqj-8dgZ-jjfCmNGtnUDgqJ_Kw5dzc_sg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: qcom: sc7280: Move USB2 controller nodes from
 common dtsi to SKU1
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-12-01 21:17:28)
> Move USB2 controller and phy nodes from common dtsi file as it is
> required only for SKU1 board and change the mode to host mode as
> it will be used in host mode for SKU1.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
