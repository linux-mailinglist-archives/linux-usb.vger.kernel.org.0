Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0544E37AF05
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 21:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhEKTGa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 15:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhEKTG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 15:06:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579E0C061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 12:05:20 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x5so21181480wrv.13
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=sUuN2OXr3bg5IpNcFwN3VBBzT8QBBnCz2bvn1No69Y0=;
        b=VvdICamAtlSI4oh55D+txrRK6oDDZ8emll3pZB0jNFhvojL6zF3AomqBgytrMBKbH+
         +52uWLGLU3ES9YmG5+CrSYBsz8faoAdDUwrbr2tW6aj5j6S2Aj6/HiCz/5Km6v/b91+i
         AMYA9/HM8iHzKpoAxDLUUyfbaMvfYJwwyUKe5pqUzH8NciuYyE5Ynct2IEV+8Oc6f5c3
         8uTqDQQSOiUaNlVbEBY+24x9Ps6nT6myROtW+SP0NjVgMIazP40hnthvkWNs2/TLy8RT
         MAoVqAsLfGljAibRQvvjI36Azc4Qp8hCGQUZLojhKzm80tTNBheX/wVlzktzz5JoX3s/
         apPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sUuN2OXr3bg5IpNcFwN3VBBzT8QBBnCz2bvn1No69Y0=;
        b=W4QqE3tuimMfKup6zKZTGnAP/QA9uTujwo3rHOMbiOSCzhqvp0QkDDfBUelo1HgaTe
         E3t/20KWgEVz0dt5clH+8UAtVCTWo2bH2DlVhYDihwNlrJQ53KMg3q1YCxJ8OU1Q4PSd
         W0uDPRsiivob3Wqg2TymCNt6AIbI5uMSWF73MBL2ybAHjB7QIEOQsBX+NTPMkjUJbNjs
         HtqhHueUL3bt2MFlWAVm/RW856WlDtf+PSWEXQ0BqZGdzEw14dCI9IppuKai/Wc1lUvo
         pTnVd1QWK5Q3MERwzM+8B3V9BpJ2WRHgEQhM1jP945+ScwHmlnKp3K2/5DwnuzdC59T9
         HMvw==
X-Gm-Message-State: AOAM532IkxcOMLddWSTSt9HFG6icZRbj1usNuQFaWZrPkRKU4kreezuE
        3XwKSdX7Z7wYkHxNVbNdn9Cri9j4wk8ulQ==
X-Google-Smtp-Source: ABdhPJxVumcif/4K6SCzOvjFqCUwDq4rWma75IIbMjoxyptzVLr0QzBxhwwSqBnjm68YavlAIJCAHw==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr36452980wrn.337.1620759918650;
        Tue, 11 May 2021 12:05:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f6sm30505933wru.72.2021.05.11.12.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 12:05:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Call init callback only when
 provided
To:     Guenter Roeck <linux@roeck-us.net>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
 <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
 <f112c2b4-343a-f8a0-c00e-f020f34611dc@roeck-us.net>
 <d4a2889d-db11-69b3-5a62-13fad2ad6e18@linaro.org>
 <71d7cdad-382c-f3a1-dd07-17d67bb2cd52@roeck-us.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <782fc3f3-2a4b-a79a-5efb-1983c6cf907b@linaro.org>
Date:   Tue, 11 May 2021 20:07:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <71d7cdad-382c-f3a1-dd07-17d67bb2cd52@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/05/2021 20:03, Guenter Roeck wrote:
> No need, but maybe submit the code that doesn't need it together
> with the change making it optional so we can see the actual use case.

Fair enough
