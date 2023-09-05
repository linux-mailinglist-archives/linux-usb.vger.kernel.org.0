Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06AEC7926F8
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbjIEQCh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353591AbjIEGtZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 02:49:25 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA3D1B4
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 23:49:22 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977e0fbd742so300150566b.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896560; x=1694501360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhpzS59cETDVJJl58LmIfvoLI5Ek49A+bTArNaUplrk=;
        b=tWevKYi02/WON0f9mhhhreH5P0nmSMFBU62Axq00HvBtXtj34KRIPCp5Dh7P157hlZ
         ou/AM8vyJHJeLJG1s7fcFDdKgGhjgA9jNftjIrk/Ws7C1xI7S+HPcpT+lwowahqpyF/A
         XBl93/GoHc8k+Vbzezqi9jWpg9xdbb7kiG8MxVpxwzg6EO/CaAeVfTJAscAatsgK0T1n
         9H6hkrOrrog5HnG4rskM0T6vtAthmQ1a4sZTU2c+r27msG1EGSwKFLpxDQS3Hp0a5eHG
         ZxJYgDpzAjzwHgW0a+KUReK5iIhKFv/SRjr7ffRDbaQpOout0eUaB6Z6k8QKnpsaTBGA
         Tnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896560; x=1694501360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhpzS59cETDVJJl58LmIfvoLI5Ek49A+bTArNaUplrk=;
        b=j4+7zlJX6AcB2VSN7MVldyULH90h1BNweZPN3PNi9wb9r9k6jA4NKH1qT7qxyeLrGS
         2YWafoKhsjJ/AHoYSJGOzVnqbCUohyk1DswD4H11dB47aVlQnGXiK6ObyEewJGBw3nxZ
         PYtCzKXYD0tguSdXC3JsmL3syZ9VBSW0bFsuKwfxwmh70ve9l8laYhzzTBRT5KYJmetI
         JhfUr7PlPGxtiT0BLau2r+jtljHTaJ4pFeyMkj3m9r+dDIrYmbp19BEyj79C9Lzt9MX4
         NxpR+tMfZwWfS6uLVTyGsZ4aoVFCIQWyo87jVJ3BNArSP4zXW5X8k8LrAhdoWeBaybPw
         DAqg==
X-Gm-Message-State: AOJu0Yy/433X4XBK103ao2h3eICDg124oCfVBvKrtMcXiCoxsRy9AXpC
        WGKgSk5TP9CWR83XZaCUiIUY9g==
X-Google-Smtp-Source: AGHT+IHjQFBB1VJsBsu+AIJLy6rePuMEP5AF/uK5pVEQorTl4ACwpz9FCi5c3zYXBuacFMfzU5OHPQ==
X-Received: by 2002:a17:906:3006:b0:9a1:c991:a521 with SMTP id 6-20020a170906300600b009a1c991a521mr7520272ejz.4.1693896560728;
        Mon, 04 Sep 2023 23:49:20 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id jo26-20020a170906f6da00b00982d0563b11sm7072419ejb.197.2023.09.04.23.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:49:20 -0700 (PDT)
Message-ID: <0a2fcbc0-4b18-a54c-9f91-9710cc0bea1c@linaro.org>
Date:   Tue, 5 Sep 2023 08:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/5] dt-bindings: phy: Add qcom,sdx75-qmp-usb3-uni schema
 file
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693889028-6485-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693889028-6485-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1693889028-6485-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/09/2023 06:43, Rohit Agarwal wrote:
> Add a dt-binding schema for SDX75 SoC.
> 

It's the same as qcom,ipq9574-qmp-usb3-phy.

Best regards,
Krzysztof

