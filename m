Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC4B466713
	for <lists+linux-usb@lfdr.de>; Thu,  2 Dec 2021 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242188AbhLBPuC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 10:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359029AbhLBPt5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 10:49:57 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DC7C06174A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 07:46:34 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h24so85158pjq.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Dec 2021 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/xOX+MwbYYm6u5nECdOl4Jqy0wvq2qfMu3Pv+iN6kbQ=;
        b=h2EabMGwDwVYPbOXG0rurfwoabYlkJcUaDSJo1Mpe8o3iddMlcVy8hOg/Gtg2pufMp
         XXryC51IdgePpIkXtjCAorrvtHzyssnDJKsMXnXokSAfk1k1VrwW/rKGG8m2ZDU3tRQ7
         EYXhwpA1QbD2QKlwoevsPECMxsYRPpBl1ENyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/xOX+MwbYYm6u5nECdOl4Jqy0wvq2qfMu3Pv+iN6kbQ=;
        b=CeKCIb60rXsiOca812rZjEPUMPx6uxUquvjkSTRUnD+2S1gbK+5fSkJ7BlPdwhbE78
         0WLt8UUbyxg3X+VW0nRu1m7iDIqGe7wNNXAAEG1aFmRBAKkawX80fWOzqLsZETmkLnhm
         GjwcUpXlKhLvkmeJvkhCf90aBTf8SUueD8CzE0jKtVscFVOqKI5JFX7CMGMXnnSgNjQY
         lBxOsEI1ehwO0+iUb7+EFnhip0CwB3iSD6nY3leWhhoUZxAJiiI0W69JWLHkGXCmbfnB
         67/AOLS6AlIj6+9L95q4Jwfio6/lRP6oocNrGdA4daiy3H7oFZw9NajHC0CrRHv+Hvm3
         vNmg==
X-Gm-Message-State: AOAM532Yqc7x4Aa1GqDSAaGYSr6P23cAR1BhA3v2w79q03rEVzymqUo9
        5aHOXiZl4H3dYl7LwYv7JWKoyQ==
X-Google-Smtp-Source: ABdhPJzh642Nqi1c66mNvgl1xHObBn1Zz/bzbAgNs+yRsC6kHayeKfeWLwpe3Kdgi1JuslnvD3euqw==
X-Received: by 2002:a17:90b:4a83:: with SMTP id lp3mr6914000pjb.242.1638459993828;
        Thu, 02 Dec 2021 07:46:33 -0800 (PST)
Received: from localhost ([2620:15c:202:201:b371:4539:c97c:c751])
        by smtp.gmail.com with UTF8SMTPSA id pg13sm18546pjb.8.2021.12.02.07.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 07:46:33 -0800 (PST)
Date:   Thu, 2 Dec 2021 07:46:32 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2] arm64: qcom: sc7280: Move USB2 controller nodes from
 common dtsi to SKU1
Message-ID: <YajqWKBBNY+dTP7a@google.com>
References: <1638422248-24221-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1638422248-24221-1-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 02, 2021 at 10:47:28AM +0530, Sandeep Maheswaram wrote:
> Move USB2 controller and phy nodes from common dtsi file as it is
> required only for SKU1 board and change the mode to host mode as
> it will be used in host mode for SKU1.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
