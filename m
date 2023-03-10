Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4ECD6B4D69
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 17:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjCJQo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 11:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjCJQns (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 11:43:48 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D682F1B32B
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 08:41:18 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw28so22889804edb.5
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 08:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678466476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTjjYJQtbu4TtuvWxLt2QQIjJTJIq35VbyX1+8b+uCw=;
        b=soP8PDWLOUDH1yqQMxQKnu/zTM82LGhO8rwxccKALtKR+Q2hx5dyDFDHndPuJFY9vn
         cz9R6dwbuVZ+v8GCNLQaGsV8xIBa+TldE3RfhTT4M8hldH1SP5chrOT3U3qIPT8JOt2Y
         38APNLHfdd3dVnfTj/uP3DUa3TNYcaCtxAczVzz/pFfvW1pB8vqUxIfEWDHN0JG3X4Rq
         WbcG12zjR5BfFJm24b7UiYkIEXbCM4C0FDNDP8wyUNHLTi9P/TrMdJqbkKfR9wnesNsB
         ZOOAEF7DTE5y/t57brboGt7KyB5Z3qS/vEx0MNRDo9IZ04EfvOzifFmWI/AN0YNz/KHh
         wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678466476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTjjYJQtbu4TtuvWxLt2QQIjJTJIq35VbyX1+8b+uCw=;
        b=pIEWI7ldYUOAOKwBePOjYUnm/GTDYyh89GJ95tpxDUDmGJCLz40lV2HDVf1ZiclHNt
         mJV1ngnsuFDuNq6BqLqAU0z3fUcX6zODN0qJNtULIrheXMaL0l/fHb7hMydEg66YPIR/
         ETokb5pGmjqqXRCJVTd5/ZU+DvvSB1WBEgHjZTn3BNvQLUg43qIlVLQzlkwdUZ4TRDpm
         l55NVGaTBaPOQr42Ea/KWnyi4Zk6PodM4mw9h+YPOzX9sISXkO4LFaDwLHCyPr2qLU7Z
         5ZDj9gV5uo+EFAG43sI6OgFJ0dWwohbjoOh7rc8/n98t5Nu4PqL1uhHJStJOWtrdgDWl
         K4Fw==
X-Gm-Message-State: AO0yUKWQlEBSEN4HS//hMmRQmkmRetYUEqwvFZ/R0QoaNfiZgYcBlP3j
        P0/PNMIpMgkIyNg2W5ncGF9yGA==
X-Google-Smtp-Source: AK7set888BEg24lAWjN3aZipydv14+liiArcckxVOwzKEM2NvVkgzLFtRmdho+bddx+EWo9ytKM/VQ==
X-Received: by 2002:aa7:d80f:0:b0:4ce:bb5c:158e with SMTP id v15-20020aa7d80f000000b004cebb5c158emr24879919edq.19.1678466475879;
        Fri, 10 Mar 2023 08:41:15 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:45c4:46be:ec71:4a51? ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id g28-20020a50d5dc000000b004acc61206cfsm225200edj.33.2023.03.10.08.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:41:15 -0800 (PST)
Message-ID: <ade5b126-9506-5e0d-3071-d26c97ecfc9a@linaro.org>
Date:   Fri, 10 Mar 2023 17:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] dt-bindings: usb: Add bindings for multiport
 properties on DWC3 controller
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com,
        Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20230310163420.7582-1-quic_kriskura@quicinc.com>
 <20230310163420.7582-2-quic_kriskura@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310163420.7582-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/03/2023 17:34, Krishna Kurapati wrote:
> Add bindings to indicate properties required to support multiport
> on Snps Dwc3 controller.
> 
> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>

What happened with entire previous changelog? This is not v1 but v5 or
more? At least v4 was here:

https://lore.kernel.org/all/20230115114146.12628-2-quic_kriskura@quicinc.com/

Best regards,
Krzysztof

