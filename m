Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027C679E0A0
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 09:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbjIMHQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 03:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbjIMHQk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 03:16:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411041728
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:16:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52a3ff5f0abso8309061a12.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589395; x=1695194195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn21ujmkr4Sp+EA0gnf8dygODVc/XuXdjn0LI3sjZCE=;
        b=CpYHGOyHsVw3HAVKXZXFkjMqXx7MIGEFKEb57tnO79+DU2I0WpCz8e3ZlcxWM6w2kg
         YXFz74qnmSBnKL05oD2EST9HW3ax8yTOSKsvZh+eNMYRnSX/vfdHonqYbq59LKysVKrg
         OONjz9Y6SP+QbFo92+ytJsobL0nR7NZADxXzv6XcIB5cAV1ECzaxusJ9lmGhIyutwdwT
         j4xC/CWuGTh6hh9hGubUqEUgsm44KCNuzyey37Vnlz2UkUAkaoRiUH+qE+GtNaVEoNAE
         J5dLL8X/4Y+xifrUVIQ8unFEQr/Lc1ljdbxjcpKLVtM3vCAllHzkoi/9G7QS/P8FmvMT
         ksJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589395; x=1695194195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn21ujmkr4Sp+EA0gnf8dygODVc/XuXdjn0LI3sjZCE=;
        b=YITY0bjVzArIVPVObA3NjA+m5yTNwHKmjNltaOk/Ez5JkMwMXfiSlKSfGWXsQ1mgwT
         JeZPc6WZnz8Q4I2WdvDwiYbq9GoWCXiuDhGSl4Nolg2U2UtB/xrL1cSYOTA4BRBdlOIb
         wlQyutPzCe3U3NRWyLGxkgSgFET9FQWjBdz4z55aUynw7u/HMRq3AKU1VNAB0s9BqyMx
         Mm8GSrFDboEueAznb62d5R7jZmPkxKvUuWqwId0ToXMh33fHpt46rT5xARVSpssPKJxC
         ptwdwlAx+c2zD58WQyH/sh8yYSBACEzKbLFXXVfbrYKkpZQwa6PPnRpgfKY++R/4QDaU
         mL/w==
X-Gm-Message-State: AOJu0Yzd64Id8fqRjrLuq3aqFZ+xhDl4UbPEOuJBG6g8dr7+QMhpU4eZ
        RXpIc1DdZx+mGHB+JPnzPa3hrA==
X-Google-Smtp-Source: AGHT+IFyf9Fx/pf35KrNLfez0lmkNaBYKL0JSrB9CFz9ETZ9MnkjYUX40l83RXA8JXM9raiowLn7Ng==
X-Received: by 2002:a50:ec8a:0:b0:523:2274:91cb with SMTP id e10-20020a50ec8a000000b00523227491cbmr1504709edr.12.1694589394834;
        Wed, 13 Sep 2023 00:16:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id eg27-20020a056402289b00b0052f3e8c84fesm4786096edb.29.2023.09.13.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:16:34 -0700 (PDT)
Message-ID: <af5b83c7-94af-1779-68da-78976fc68fc7@linaro.org>
Date:   Wed, 13 Sep 2023 09:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 08/14] dt-bindings: remoteproc: qcom,adsp: Remove
 AGGRE2 clock
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-8-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-8-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
> within the interconnect driver. Attaching it to SLPI was a total hack.
> Get rid of it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

