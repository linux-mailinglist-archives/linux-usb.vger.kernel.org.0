Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D053163747
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 00:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgBRXfB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 18:35:01 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:34507 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgBRXfB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 18:35:01 -0500
Received: by mail-wr1-f43.google.com with SMTP id n10so24101169wrm.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 15:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2jfZn7HgijJcwCVtPKO+3froana8bPYhk7cFugVBd9k=;
        b=oXfuzBzwgbbcaxtCA0rwbdhtXClKld69lVwUded5y/tvutAyYEy220phgEeiutYHZo
         LGEcuhjUCQB5q/faEjWnxjYFVU/9Z3siMIBCLvgnxX7rBN8eA4e84HpCQVH2ijp0Bzzo
         2jl3IO79g9+gvDB7z66BlgCFcseSgnN8JDnekAQx/q/tA36X5MQX9bkiF8Tovbqet8TV
         yos6rsTBYib0wgCAJEqImx/jDSQQr8qCixqSUDmY/uevWOOYOA10Qc4hOQdlWyyEFkHi
         LRBsGZaCuPzXskuEvKEMxUn2U2cbRdENoQFFyehzUFrv2/wks4yv1hvaD+dGPESsVOcm
         /rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jfZn7HgijJcwCVtPKO+3froana8bPYhk7cFugVBd9k=;
        b=AXsCjD1VN9a6D9Hg+7IgaeGn8DXNBcp8982SbZqRqRSdIZgHM+7waRfSXho93460xw
         cdq1WbNuhjNlCSQfL1KmwrZLG3r3TIUkB1Qflik6Qktb0vTKLGN2WvFzkVDz3W4MI1S4
         Bby5XPDXawOLv23SkWWlo+Ls5gQCMH7BeInxqViapTZor7IHjPmP9qPKaHbl/p+6eHJj
         gewpFWcPmRNX+4LilK9TCiPuppI9vnpVXYqq9KrCK6/wiwrfxKltPzH1xwARJBGDUWC+
         2rxprqXAhs76AmNSsLjC0WvsK4LVR5JOfhYfs+kEUsTWQpH4YoR41RiIiHBYv860wodd
         b3Ew==
X-Gm-Message-State: APjAAAX7QEHAsUTQlldoJxJVdUb14OK+9Ynw2bddvLQl3YTTp512+R9n
        xNoQNXmTKo2fmCZCgYpJVHk/Zw==
X-Google-Smtp-Source: APXvYqz7abx4IsR23n+MfNd9cDZHQJRsQFOsZ4S9ShnuWZIFGqFxGYZm9BB8iqJIAEVXqHQ95n68RA==
X-Received: by 2002:a5d:4289:: with SMTP id k9mr32507475wrq.280.1582068899769;
        Tue, 18 Feb 2020 15:34:59 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id r5sm325750wrt.43.2020.02.18.15.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 15:34:59 -0800 (PST)
Subject: Re: [PATCH v6 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
 <20200210120723.91794-5-bryan.odonoghue@linaro.org>
 <20200218204558.GA5022@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <bb39f51c-1285-a93d-006d-f1dcd3877925@linaro.org>
Date:   Tue, 18 Feb 2020 23:35:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218204558.GA5022@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/02/2020 20:45, Rob Herring wrote:
>> +      - qcom,usb-ssphy
> Pretty generic... Only 1 SS USB PHY in all of QCom forever?
> 
> IOW, this needs an SoC specific compatible.
> 

Analog IP doesn't generally move across different litho nodes without 
tweaks. I take your point.

I'll take another look at the naming convention here.
