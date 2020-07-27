Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164EF22F8E9
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 21:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgG0TUw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 15:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgG0TUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 15:20:52 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261DAC0619D2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p3so10435473pgh.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=AaPrVOqNWMgqMpxH88BEQJnuih5t7lG8Pv8holLzmGEU4PKPfhWaJFBe3+epjBa5TG
         Keaw7CEihV8ZtlT6zoxgh/RsdsdBJpqs4TK1Q0FOtw+Q+IDZMp3VNvwboWf9iZB/5Gh/
         RmXdaa/Uox3jj+vCZXTE35yj488G1nA9Bf82c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t8hLkFIbtpdEX3UBYFfNbS3mhtXXCA/FYFZZm/zp7IQ=;
        b=WmyCmZvZn2aALw/K59CrhHy9xEz4R/lLr3renxzbowyXPPq9HJTnMqd8P66BhZBA2F
         4FhmampIdBq55aHTOcy06ZVVI64eRnUWvO2kfb5ZM8e36TfRyaYMp78cehru700ERWLW
         3k4J7CvShNYYe4Lx0w9+BbbyY9QfRaMi8j4iULk/JC2nrrzOqVK87jGSnl2jBztDjYXp
         Dtz6PFvKHU5x4HJRE4+EuTROES9yNS9n17vtWtTo5f8SouEjrC21I/UQaZTI5fQ9UUVU
         Ao/xKUV+Wa38l6IETty/Qw7ZJ/bqoF1bkRGIkGNwTDyRrttAfBd8N4e+AvNsydv8tAgJ
         b5yQ==
X-Gm-Message-State: AOAM531HFDvbTbWxGzwSCqgJb0fQMkSukFmYuSYg9RKBx10VwkdsFnxw
        yjtA/6fE7oB/v5mNos0P3lRF2Q==
X-Google-Smtp-Source: ABdhPJx0j3o/dfARdxLCxZFu0QCg2nY4pjGflu6c0tuLw5tUQhIucFl39ZjiLASPZto5FWJNbE3ECA==
X-Received: by 2002:a63:6c0a:: with SMTP id h10mr21194250pgc.11.1595877651605;
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id u24sm15605054pfm.211.2020.07.27.12.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:20:51 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:20:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v11 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727192050.GD3191083@google.com>
References: <1595869597-26049-1-git-send-email-sanm@codeaurora.org>
 <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595869597-26049-2-git-send-email-sanm@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 10:36:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
