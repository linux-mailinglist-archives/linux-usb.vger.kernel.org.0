Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42AA5174373
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 00:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgB1Xmb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 18:42:31 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35314 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgB1Xm3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 18:42:29 -0500
Received: by mail-lf1-f65.google.com with SMTP id z9so3372066lfa.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 15:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iId8/Patumvx4bfeqRK0XfOfMMBiyM4YKPgGmeoe3Ic=;
        b=jR9hz1HnsFYdmlGMnV8RJw+1wYnmwgmp5F4eYV/HQJq0IT8X9BmWqLirtywy1i2QP4
         PENcGt2urlSOb7+1q2awxksqIf8X5fPoDXtpW+LGhA4OHuAGV/S+OJrrdNiN25PDwSId
         oBmLzMgzt4wjcsLTuSyUutMgMmEgIhzVmQS2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iId8/Patumvx4bfeqRK0XfOfMMBiyM4YKPgGmeoe3Ic=;
        b=NhKK37FRX4Sc77I37U+iuECu3D02cPR2OImx+4XCDJBoO/IUW6zmoBeiF9V88UMKs8
         h17Fnv67qhVADD48ENHd3aV+xeR0JjG8KqYYV8xuQNUsHlQ9ZMXGVaudbhU7P7Cg5tsC
         7rMQM8xesDFYAapmkG1GEJkNE7RgnWzInxO4nLszNCNICfNhDzs8ZzzKPkkNnNKWQQ3l
         yznCtOZiIA8pMculF6i+/lER5j2jx8O4ENGFgpKh/DVjoB1xLCFAMHfznuAcs0k3yqwl
         /+nzc4k9yRS/SlsI/YKLmLOsPtrDCyvaC4cJiNTrg3pSQYM43TUvUhr29djPMt6w+maH
         sQvg==
X-Gm-Message-State: ANhLgQ3R4PC32ZJioTMsgD5OFDKJTJW8rVvTr5BZNcWFK9QEQRSBn7ZW
        4f1dEm8in+rJy9I47aG8aG4VGpz89u8=
X-Google-Smtp-Source: ADFU+vt52k4DN2LrHkvDNg/uJetNNldBnlpHrXPvzILXgLumR1tmpee//5Eo1Z7xxSnYegu2MkTeHg==
X-Received: by 2002:ac2:5473:: with SMTP id e19mr3957930lfn.202.1582933345526;
        Fri, 28 Feb 2020 15:42:25 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id a2sm4771578ljn.50.2020.02.28.15.42.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 15:42:24 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id w22so2336673lfk.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 15:42:23 -0800 (PST)
X-Received: by 2002:ac2:5226:: with SMTP id i6mr3661642lfl.99.1582933343335;
 Fri, 28 Feb 2020 15:42:23 -0800 (PST)
MIME-Version: 1.0
References: <1581316605-29202-1-git-send-email-sanm@codeaurora.org>
 <1581316605-29202-2-git-send-email-sanm@codeaurora.org> <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
In-Reply-To: <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 15:41:47 -0800
X-Gmail-Original-Message-ID: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
Message-ID: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sandeep, are you going to spin this series?
-Evan
