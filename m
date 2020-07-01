Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785682108AF
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 11:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgGAJxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 05:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbgGAJxv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 05:53:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9C7C061755
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 02:53:51 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so11477989ljl.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I/f76nykIhM6w0mxf48ECzgXvFwae3Is6/TNMPfjn/g=;
        b=hHylQbZLWSMQvS+jL34OrCHviCm4p06ax2jAB/Gk6urL4J4jxv5/8rGojKeQYyavdF
         eUZjOvNtNz3QhibHh99I1upSXQk+yzeqQd/g2SWIe/VtzXAVgv/mgWpD9UIb0YNRAgbj
         KVqqaDF1vwJPVpxYHiKVoAz4f1kNAsfW8Z09jIKsmCMZYSm9W07AH8sbiZYH0xFptYNi
         FINJHAq3qgwJbmmg8ODhiVgh7gwiaokl9KMGMVrkQ5veQbQAXBSCxRtxS0bpfBRDderz
         B40j2OHIWh0NazuHUyGGv+AEjI1RnzWn4nmiMx66VBnbYQACDMfqQqBhJ5EZ8do0L3g+
         dguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I/f76nykIhM6w0mxf48ECzgXvFwae3Is6/TNMPfjn/g=;
        b=dk/hIgdU3G7pDE5l8UOOBUeIUIkyjDNb+fH2gu+Lbb0nkMrs6LCGxJEdqR7h7TB/o6
         PRblQjrqIsAN6ccTLD8y5o5gSwRO5K2E5oyokNAhvE757kiPJSY2z8wGSU4mGYnSEei9
         1k17Zva0BpkShUaIi68qh0Mi8z6DDHNN2JRJrRybcX3qv7klK1XsmaGhVfSn9XDtHrmc
         hFkBY4rynFIYCS1WGXehjipQ670jNF8HdDVpi9wGGe2bnnXgdmlCjUCdPZXHG+lmByQB
         iawvyZFujCgzIEWlTD14i89kk7mVuEBc2XMEmh6hqoZeEBGmubwY0+VZ3fzjGLRUIQ1j
         I5HA==
X-Gm-Message-State: AOAM532ZXGK1JvqNQRalwaE77H0KkvtJ2szfOek6z9k5qfNDgLA4sojl
        qt2VTsh8lF3BYkK+msvBqTOnGg==
X-Google-Smtp-Source: ABdhPJybcGIOrEOu+a0vnS84yjr2LYNSdi2py6iNCYBfKtpSPQpRWXdix0qcB7FFBX+acLzcyU+ejg==
X-Received: by 2002:a2e:4612:: with SMTP id t18mr11798162lja.212.1593597230086;
        Wed, 01 Jul 2020 02:53:50 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8e8:f00c:217b:dbd8:22bd:2e1d? ([2a00:1fa0:8e8:f00c:217b:dbd8:22bd:2e1d])
        by smtp.gmail.com with ESMTPSA id g7sm1859496lfe.62.2020.07.01.02.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 02:53:49 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] usb: dwc3: gadget: when the started list is empty
 stop the active xfer
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org,
        Thinh Nguyen <thinhn@synopsys.com>
References: <20200701093137.19485-1-m.grzeschik@pengutronix.de>
 <20200701093137.19485-4-m.grzeschik@pengutronix.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7b90da3a-bced-3876-871d-a941c5caa4ba@cogentembedded.com>
Date:   Wed, 1 Jul 2020 12:53:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701093137.19485-4-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01.07.2020 12:31, Michael Grzeschik wrote:

> When we have nothing left to be queued after handling the last trb
> we have to stop the current transfer. This way we can ensure that
> the next request will be queued with an new and valid timestamp

    s/an/a/.

> and will not directly run into an missed xfer.
> 
> Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

[...]

MBR, Sergei
