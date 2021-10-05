Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90145423069
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 20:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhJESxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 14:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbhJESxt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 14:53:49 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEAFC061762
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 11:51:57 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id s69so514579oie.13
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LIIZhO6QemCxBZ+WNeUA1NEuSGEugkxriOxoUlLOrtM=;
        b=Y1nq5bwPYgRtZSjzARwnqT6iVgQ/xdr6g8NM7LasqBqbPZpI4zP1qfDtiPCm3SaWPr
         jrdpR5Tx34tO4K7ERkIGnrUhYh3+v/jVh5GhPPfbfud6u6GE5I6i0Rr4W/eNnlf8HALN
         BsGPH1DMJw5cFM9cMKPantLExCmTQIv+nQip4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LIIZhO6QemCxBZ+WNeUA1NEuSGEugkxriOxoUlLOrtM=;
        b=IUinYYjzLuqi3AMuiz1/mpR4Oegeb9UUx8UESHDbxqw0TPB5wWHi3tQjLrL8rb2vYP
         1qvGcwlpBxY6+GQKUlX+TQvyMUlqmmpr25v+lgmiOY1vP5h+l0rLnLMz3sAqG+frZKXW
         /kr4V7ebnafoeJWGyL6hldLtmIPDSSC9Dj8kpPJn23LuG0tVIoanV/2kj1TycT4iNgid
         OlJjjVfXjNOKde/n1ggWRlg/uTgdb2I0wa1n6auPiYrltRGZLB9H9bII47j+5t64wJjl
         0dygf79gW7xYUDouxbkctVbTjm9CGNiagCYYI8ncRMiXBzXbjMt+oKe+zsHlA0qGEpKd
         Vp/w==
X-Gm-Message-State: AOAM532+DzmCZ5EXYrj1Nx2QzAoCf9710S6imYWP2fKE3Pk+nxROOosU
        V8VR5EfAPf+Qlg1gXjf9IbNyX2GLr+lQGYWe/dvGsw==
X-Google-Smtp-Source: ABdhPJx3bk6kPZwvGXnigGeMH3u2Pd/DyxwzdF0vLz40GZdxglzimeBZyFdhqzgXgqztcirSxk8zy1Y/fjFQiUbZmPM=
X-Received: by 2002:aca:3110:: with SMTP id x16mr3979222oix.64.1633459917288;
 Tue, 05 Oct 2021 11:51:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:51:56 -0700
MIME-Version: 1.0
In-Reply-To: <1633459359-31517-5-git-send-email-pmaliset@codeaurora.org>
References: <1633459359-31517-1-git-send-email-pmaliset@codeaurora.org> <1633459359-31517-5-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 11:51:56 -0700
Message-ID: <CAE-0n511H+FbPCbSb+FP0VMsrTmA4h8Q9pfk-=4zZPnwLuRAPQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] PCI: qcom: Add a flag in match data along with ops
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prasad Malisetty (2021-10-05 11:42:38)
> Add pipe_clk_need_muxing flag in match data and configure
> If the platform needs to switch pipe_clk_src.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
