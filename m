Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5323F78441B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 16:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbjHVO1q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 10:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbjHVO1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 10:27:45 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A90CDF
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 07:27:42 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31adc5c899fso4226925f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692714461; x=1693319261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkiFxcivFfenyibCtLArIRoHDbfSM/KDMVRPJ2MbFZk=;
        b=VWOo3yPRxUsb1gsbhyO2ClqyJJ5GTnkN0NILwrTx7VFNjQbO5I8CkFw75bZ2w0Cr48
         pBZpW3k3coahaEttruEqrLcbuuV5ulYEdlsed6gQGu3jEFkKPgWIlRuPFKl3z8cTrf8o
         Fv1XmAunxvrT8x2Gg5wVP5PF7N4eKUkQl+cGVz2KtdxDb8URLniUf2Gw7FEqW+k/Vzi3
         gh4sc7vGFfg7y8uH3FI3b0dYr3rcKdFh1ZJr3fYl503XmFLNrt7s9rKEyA5NxD7gFjuP
         IfsIW+XMaUJLZsDTtWVdu8safxkqTH0mjE5Zz2IpuCLfXEghEFWTGvr8wtuJ8TyNktnO
         jOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692714461; x=1693319261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jkiFxcivFfenyibCtLArIRoHDbfSM/KDMVRPJ2MbFZk=;
        b=iSjNXpsCUpDH4iAuv5oX1J5M2HdhHrBhav0hXpa7huazMmyPdso4JxW0X4n2SMdY2D
         db7LA3PQy28bZsKYMC6+eZ+R3cW4B2VlvE6jG3rZ1tDcBlA0T3nmHfClsm0BO0QnI48P
         GaabTzFlHwi4Dc5+q+BTynTseNJn9fnVJcdGcOACXNJQJng8Qa/InvA/ES16fQwS6RsJ
         WC18aTfUhlrTC1O0MJw4bKKWaLvbccpZDJfSRz+u5OSY/Smmu4lCapeE7wG2eMx8Vf6N
         +7YNluhnA7u2e+qtQt5gEEKKlErufhy5uHEsO+KjNkwd7maQHvyCFbFWb7qKkHR/dmvy
         cETQ==
X-Gm-Message-State: AOJu0Yz01IEAkZuMM3fQcqK1HNBsNukmVW1VAmDpjRADkelb5I9VY7kK
        Ei4SgLAdXqUj9IdR5CaR8FZugg==
X-Google-Smtp-Source: AGHT+IGgjhmwS/wkkkK4KZkuyhlA50d/pLDt6irkTL3J8r5GnfiOSYciMcEB4GyHMh/PIpziM613kw==
X-Received: by 2002:a5d:4403:0:b0:31a:d49a:38d with SMTP id z3-20020a5d4403000000b0031ad49a038dmr7100669wrq.54.1692714460822;
        Tue, 22 Aug 2023 07:27:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:de4a:6da8:c7fc:12c? ([2a01:e0a:cad:2140:de4a:6da8:c7fc:12c])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe790000000b0030ae53550f5sm15889927wrm.51.2023.08.22.07.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 07:27:40 -0700 (PDT)
Message-ID: <c266b761-ddd3-4b29-aeb7-fc40348f0662@linaro.org>
Date:   Tue, 22 Aug 2023 16:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Content-Language: en-US, fr
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <20230822141918.GB14396@pendragon.ideasonboard.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230822141918.GB14396@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/08/2023 16:19, Laurent Pinchart wrote:
> On Tue, Aug 22, 2023 at 05:17:37PM +0300, Laurent Pinchart wrote:
>> Hi Dmitry,
>>
>> Thank you for the patches.
>>
>> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
>>> Supporting DP/USB-C can result in a chain of several transparent
>>> bridges (PHY, redrivers, mux, etc). This results in drivers having
>>> similar boilerplate code for such bridges.
>>
>> What do you mean by transparent bridge here ? Bridges are a DRM concept,
>> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
>> handled as one, especially if it's completely transparent ?
>>
>>> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
>>> bridge can either be probed from the bridge->attach callback, when it is
>>> too late to return -EPROBE_DEFER, or from the probe() callback, when the
>>> next bridge might not yet be available, because it depends on the
>>> resources provided by the probing device.
>>
>> Can't device links help avoiding defer probing in those cases ?
>>
>>> Last, but not least, this results in the the internal knowledge of DRM
>>> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>>
>> Why so ? The PHY subsystem should provide a PHY, without considering
>> what subsystem it will be used by. This patch series seems to me to
>> actually create this DRM dependency in other subsystems,
> 
> I was wrong on this one, there are indeed existing drm_bridge instances
> in drivers/usb/ and drivers/phy/. That's certainly not nice. Why do we
> even need drm_bridge there, why can't the PHYs be acquired by their
> consumers in DRM (and anywhere else) using the PHY API ?

Because with USB-C Altmode/USB4/Thunderbolt, DisplayPort is one of the
data streams handled by PHYs, USB-C PD manager, re-timers, SBU muxes...
and all this must be coordinated with the display controller and can
be considered as bridges between the DP controller and the USB-C connector.

As of today, it has been handled by OOB events on Intel & AMD, but the entirety
of USB-C chain is handled in firmare, so this scales.
When we need to describe the entire USB-C data stream chain as port/endpoint
in DT, OOB handling doesn't work anymore since we need to sync the entire
USB-C chain (muxes, switches, retimers, phys...) handled by Linux before
starting the DP stream.

Neil

> 
>> which I don't
>> think is a very good idea. Resources should be registered in their own
>> subsystem with the appropriate API, not in a way that is tied to a
>> particular consumer.
>>
>>> To solve all these issues, define a separate DRM helper, which creates
>>> separate aux device just for the bridge. During probe such aux device
>>> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
>>> drivers to probe properly, according to the actual resource
>>> dependencies. The bridge auxdevs are then probed when the next bridge
>>> becomes available, sparing drivers from drm_bridge_attach() returning
>>> -EPROBE_DEFER.
>>
>> I'm not thrilled :-( Let's discuss the questions above first.
>>
>>> Proposed merge strategy: immutable branch with the drm commit, which is
>>> then merged into PHY and USB subsystems together with the corresponding
>>> patch.
>>>
>>> Changes since v3:
>>>   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
>>>   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
>>>   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
>>>   - Added missing kfree and ida_free (Dan Carpenter)
>>>
>>> Changes since v2:
>>>   - ifdef'ed bridge->of_node access (LKP)
>>>
>>> Changes since v1:
>>>   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
>>>
>>> Dmitry Baryshkov (3):
>>>    drm/bridge: add transparent bridge helper
>>>    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
>>>    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
>>>
>>>   drivers/gpu/drm/bridge/Kconfig            |   9 ++
>>>   drivers/gpu/drm/bridge/Makefile           |   1 +
>>>   drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
>>>   drivers/phy/qualcomm/Kconfig              |   2 +-
>>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
>>>   drivers/usb/typec/mux/Kconfig             |   2 +-
>>>   drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
>>>   include/drm/bridge/aux-bridge.h           |  19 ++++
>>>   8 files changed, 167 insertions(+), 86 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
>>>   create mode 100644 include/drm/bridge/aux-bridge.h
> 

