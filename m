Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC1D611BFAA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 23:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLKWNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 17:13:49 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33109 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLKWNs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 17:13:48 -0500
Received: by mail-il1-f193.google.com with SMTP id r81so268340ilk.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 14:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=d5WomvyX4tnC/dQgAK832nGB1Kl75yZmGi7AihNVzJoCrM+aW4Ie3qCVKGeOPc5KJm
         snJvRR06tTFUg6q/r4CpZg+XqLsV0mSiWfTAT+ctzmceBh1B3nzgA92CF4cf6SHIA3h8
         ov94DUQkYXaaarV15MIN98KM6+XFZCUv+7GaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WK0R3vgtayVNUB5s3/ppzS6WIJXfYbPpsi6siOolE4=;
        b=bA+J3G+/Hn3B2fAmVe19qFynd9uhShpKLkE9pkgaymfO0Dbouudp1dRnxr3YW+bVtU
         tJpqUFx0fIW16yH9neLHawKbxA/so84p2C64+MXyRNVrz6gp64KyBVqyQ0FB8yk5T/tV
         nkuepppU+mh5g+xoRXsjhYQVvkBEXzBGf/3Pymd6k6C0vp5LXSEc6QYt0imFVLQmn6Or
         JOelZ5AF4Wpk1mH1lgF/PBun4Ouz9DiZ+4dJKignEnIlh0uZWnKk6rFAKFHxa5Qyubhs
         mDgFckVhFbqvELCEznYbkqxZTF5cOxxjvNF3i3F87jfTaO0NsqbFnnxsb5kNsamiLyyD
         NYyg==
X-Gm-Message-State: APjAAAUzmgO6GVZQn8diNZaWKwn+vdTk9IyAxit9xmXDwwJMBeL0YQWn
        BF/nKPe230sufymGlp4h5IUmj3y7xYo=
X-Google-Smtp-Source: APXvYqxntn272Pah53R1x4HAqr37TDM2RIxOkEeLjt8oMgJvV6nSHMT7rmr6jYLq5A91EXyBCL3vaQ==
X-Received: by 2002:a92:868e:: with SMTP id l14mr5422700ilh.111.1576102427965;
        Wed, 11 Dec 2019 14:13:47 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id z21sm818217ioj.21.2019.12.11.14.13.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 14:13:47 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id x1so498641iop.7
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 14:13:47 -0800 (PST)
X-Received: by 2002:a6b:5503:: with SMTP id j3mr425338iob.142.1576102426904;
 Wed, 11 Dec 2019 14:13:46 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org> <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1574940787-1004-4-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 14:13:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Message-ID: <CAD=FV=XWsN72pvtHubq2UOgvm6oPs2s+RA61ct5XPGsBDbA13w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 3:33 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add compatible for SC7180 in usb dwc3 bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
