Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6099785689
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 13:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbjHWLNd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 07:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbjHWLNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 07:13:32 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF42FE51
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 04:13:29 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so2616045e9.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692789208; x=1693394008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbYjS/cBWGkU59BDMZfwvb2Rj3H4QCmMH5/xqbbwdFU=;
        b=hpHpmPxdO1YBXgCk5vQndP3QSjpee+96UDmt1vUmlJDzx6hF3G1VD3XvrhXQDnBx4x
         IxuTyichE/GGifVVtaqKKKpT+8Xyl2IsXVluQrH4nMEjDlkgNcenmc7bkkV+xaYqngnk
         jXU+z1dKB6HXdEdF9wzYXI+fejgG9uHMWxHNphHEJINclbvc7yQhTzRlCpDpGI/upy/G
         Fe4l3UeunUexPHzzNFN+WKa0gQiyrOivGzqIpFazTXfY0Wl6MMDnmHoeT0dSsy2Kni2b
         59dGrY/MayR0ZGxoWHMdBBl5o5VN6a3iN/S4i4/Tz+DN4PAMkmfv4yOtaD5sYgBLCqYe
         5HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789208; x=1693394008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbYjS/cBWGkU59BDMZfwvb2Rj3H4QCmMH5/xqbbwdFU=;
        b=ZEhUHZqHmsRvQLcwX0xiVCIeZ7OUQemfvWkiI2YiZ1/8LEWBbhOF0U/L961EzWqWWr
         HWL/UbkJ6m9CRPyyxc9gl83hl52K6syoTfRyaXT1w11iHVFa6QTmZe1M8LL6/Du/k1Mj
         Ck07N+2gasHpOp1Nbn/i73EKeEoIpYPuoHIEcRBv60qMPSRo5AUsipqMQgPT+qChlcnH
         Qzfv2AWDyeO8CcSF2aBnxtECRRINzjfAldOQT2OU1GvW2F+Z9JPdzKIr43luxBSrwXfN
         ZKDJWDW6Y8UhEazBsWS9y5EVKJ6kDaxgN1DM8JB9QsC98wPePB7Mx/HcI/vFHQwcxt7n
         rHQQ==
X-Gm-Message-State: AOJu0YzqofkQrHBZqTcVVKirz9FYwWg3ae7uKO9fhHyLBLbKgmJsFuQt
        v4QL4SXCM0Z7puuWSiN0F/YfjQ==
X-Google-Smtp-Source: AGHT+IFLogCBvxIPJfiavbOMDUod3X1ur9veAQdK8t5D/OcSVmFHxFwHLi/a6fmaLDbJytPOL5BZlg==
X-Received: by 2002:a1c:7403:0:b0:3fe:687a:abb8 with SMTP id p3-20020a1c7403000000b003fe687aabb8mr9400967wmc.7.1692789208193;
        Wed, 23 Aug 2023 04:13:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t23-20020a7bc3d7000000b003fe1fe56202sm18704980wmj.33.2023.08.23.04.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 04:13:27 -0700 (PDT)
Message-ID: <350efa30-ee31-d030-38e1-20899f785c64@linaro.org>
Date:   Wed, 23 Aug 2023 12:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     hui liu <quic_huliu@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230823-qcom-tcpc-v1-1-fa81a09ca056@quicinc.com>
 <64b2a748-ea86-f804-9f8a-881b0dcc7050@linaro.org>
 <d376686c-b700-407c-9a88-88942ef3e776@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d376686c-b700-407c-9a88-88942ef3e776@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/08/2023 12:06, hui liu wrote:
> Hi Bryan:
> 
> This change is used to fix a real bug.

okie dokie

Could you please repost a v2 with a

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")

Cc: stable@vger.kernel.org

And please add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
