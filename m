Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6510117E668
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 19:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgCISHO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 14:07:14 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34100 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCISHO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 14:07:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so5077269pgn.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uSDDm+szHmvIWUPLQNgJK88QQsyLobcm7m+erYi43MA=;
        b=a94axufRiybOs8QUmxdRJUFDKVHtyzYU52JehSFnSfSSbUCNc5D5hcmvKKJb2xycUk
         Qta3py6TaSaj+JanBvfoDP42W72bqzPNKHvi/KVbGDrBBnpjS+Mv5ofJXN3xRKGN3Caa
         vVbrhLTL5U5SG+YIGR5iDxV94lcQPjylD41S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uSDDm+szHmvIWUPLQNgJK88QQsyLobcm7m+erYi43MA=;
        b=tr1cK5q+KE+LVnxlbxdVvTM6Kh5ibz5ORd04MfCXbr+i02Yhcx2lakBCr7qr3/YE2Q
         Fs/pfK6JEM/+uKvqZDRde+amTVlMZ0f41fXufEdZRPuH3ATHif6InDT6/Dctrc/B0gYI
         NAMQpeMcOjVI0qOwWQAR/jl1xJX3J2naiMvT0eUVkrU8UbCYe4S63+NBEU+ir6BrcqFj
         Po4fzlJD2REUzWeQaI6teIAS4QZt9Yqih/rXONZ6Mqzt2+bkxjB/cOS6Gca5cZEfaJYR
         hVb5ZsXGQuI5hIczR6Y9xBuT7RgG0Lq/RXeIRt5+KWaIcqkUbMpXKBsolAEDXlaAZO5B
         kUFg==
X-Gm-Message-State: ANhLgQ2VweTT4aH42x1Zv7ZasGBTzABgKC4oXB7VtOD4ojN4gMJHu+/S
        rXVB+hQSDcny1GtmqkIaNFgEIg==
X-Google-Smtp-Source: ADFU+vvY9aLEitVJtJPOO+vFStdZSayTG7guRMuMoXAdUXidcTnSY4YMWpIA6UahObJI62YYr+9DKQ==
X-Received: by 2002:a63:844a:: with SMTP id k71mr6844622pgd.79.1583777232712;
        Mon, 09 Mar 2020 11:07:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b70sm5500362pfb.6.2020.03.09.11.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 11:07:12 -0700 (PDT)
Date:   Mon, 9 Mar 2020 11:07:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200309180710.GY24720@google.com>
References: <1581316605-29202-1-git-send-email-sanm@codeaurora.org>
 <1581316605-29202-2-git-send-email-sanm@codeaurora.org>
 <158137029351.121156.8319119424832255457@swboyd.mtv.corp.google.com>
 <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE=gft47is6Td7dtM_FmP1g6TFv+yRYuz7yca015YXbRRDon5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 28, 2020 at 03:41:47PM -0800, Evan Green wrote:
> Sandeep, are you going to spin this series?

ping
