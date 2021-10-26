Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C921A43AD93
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 09:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhJZH4I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 03:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhJZH4H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 03:56:07 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEADC061767
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 00:53:43 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d10so13445174wrb.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6vqMz3JcqjDkswoc19zUoUX/dX4YcaEyuIem6/Iq3dU=;
        b=YUItPHu56iId3ElZeKhnRX6QlJGDF5MALSslBLPMyI52huuSuByXokk5banH8pHlgJ
         u5Nto7cc3VdXOc1uCv3MVZDVnO1ZDonGnfCsOe1A9+WwEC4ouu3knRUflTw2zqkEW5JA
         iqLr9Ibo2BRnRiNxhMzdRFTn9r9h+8URbTocZpVZUGIytawnH0SQmqNVs0XhKfhYg/F6
         2DGCgH3FYG0O5kXNrrqvpuuWZ3U21eg0wFa9cDbJJpXOWacehmwfpYxB7rs7aDC4FFc6
         krpP+BXcY85jIB6ezK82d5sp0nenjtJFVkolRiv9O6/poPhNkeQMF0BQ9wuJ24wJcyho
         t6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6vqMz3JcqjDkswoc19zUoUX/dX4YcaEyuIem6/Iq3dU=;
        b=fyot2En1kYvLYqlzFzTcI9FPBk4Biy1tpB6xH+llU0pDN1YbuJnyaPza0oKCWZ8OME
         PCPUstS9GdqIzoCBQoGDYI5tUKzy+p8PpbX5YcuVKpv89fzrVFDLk3Zlaf6iTmzwJ74/
         eZm05Zmjs0eauNNlC6Q9q5EYLOxipjUDtEXbjkRhqWlriRV9vwlLvz8P0t/9DN85PC2c
         7Xu0JMGlCT7klvDxdcGpSAaOIXPq4G4TzJaDIrAg0yirQk1aSasqULqyV/gJk0Ili5LV
         9etk2g9Zp6P3RbbC3TAxf/m8QAQ6od1hVwjIe9rvM10i/Wg7HDx+Sm5KF579RU0Hc7rz
         mc0g==
X-Gm-Message-State: AOAM530wVCtG4uXf0Zk19Qa42r/F+Q1bOud6udsYP2xoPMcY6eKdx7A7
        dhVNwic45Xam+5VCSkKQs6MzjA==
X-Google-Smtp-Source: ABdhPJwN/QLw1qYOXmsJMoMyP3CpZtre26AAguKxEtVzstRsH3sfWI4XXGLhTKcsIbKoUWsOb87G4g==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr29972666wri.398.1635234822382;
        Tue, 26 Oct 2021 00:53:42 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r27sm18031461wrr.70.2021.10.26.00.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:53:41 -0700 (PDT)
Message-ID: <189cd7d0-4e97-dfdc-c373-862b7f5b75c3@linaro.org>
Date:   Tue, 26 Oct 2021 08:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 6/6] usb: typec: qcom: Add pm8150b TCPM driver
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
 <20211025150906.176686-7-bryan.odonoghue@linaro.org>
 <YXeyb76jh4bim3lS@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YXeyb76jh4bim3lS@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26/10/2021 08:46, Heikki Krogerus wrote:
> You don't have a Makefile in that new directory typec/tcpm/qcom?
> How do you compile these new drivers?

doh !

git blame drivers/usb/typec/tcpm/qcom/Makefile
fatal: no such path 'drivers/usb/typec/tcpm/qcom/Makefile' in HEAD

thanks for spotting
