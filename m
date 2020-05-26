Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703261A8C82
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 22:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633178AbgDNUb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 16:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633163AbgDNUbo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 16:31:44 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC32C061A0C
        for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2020 13:31:43 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m21so452656pff.13
        for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2020 13:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KvEg77doNLDzNxGfMI9Rhj8uKkWfoxdVPh7FOq7KA9M=;
        b=dw8jLdsbWZ6CDS0pB0qnJU6MRd4mZxnk1zNvrKzhqaB11JoxWnZpGsRSVr2kJPPScC
         arQcdoCVyvvxJxWV0uoessbrRiJfQzkEooIeCiKz8iRFD2IDarymsBzgPX+GZLQde0KB
         y6Rr/DECD+Nav1GKv2jK6kvc+gdVYf+2txjHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KvEg77doNLDzNxGfMI9Rhj8uKkWfoxdVPh7FOq7KA9M=;
        b=DT5DygCH3gD8JRIETDuaVIDUuzDyq7edtaaLRTzToM7OcbCSpC5LrDq+XtvfZsxix7
         eIHOKLSAG0FbeTM0d4+IpkNBEH1hO4d1UBV7vY2Wp4RF1A2Cyfb3x7TLPKj8ZhWcuNDM
         Sux0N2frtiqtoXwh+5U7AWuJDDys0tlJAVb6dZivo3G4WClFJmSf0BRwgPQHAUcMhEOR
         QnQIo4DkKZeaIcVnsE+f8xbHYFBpImybavY2+oK2Bk1Gerwq+Al+y0ZIkdK1+xbwMU9O
         v9VTAYRxJ5lT/ki/mqEW0ozOwcd7qq4eT3mzc9ZlbZ23F73/0TaaJr1YW36np53eqSG+
         /S7w==
X-Gm-Message-State: AGi0PuZi1v6FcrfloAy1fSAW9uwzrbrq7GuYSbg9SICy626TsfhkPO/W
        OT7vsGyZoD37Pc5z8oxl636Pkw==
X-Google-Smtp-Source: APiQypINr7mOtduZ95fKBHP8P8/xhtFbUcbxNm92yMg8RWHL43ZBo6qn6/7qsqN6lHTlsu3cTO+mmg==
X-Received: by 2002:aa7:9471:: with SMTP id t17mr24339663pfq.272.1586896302796;
        Tue, 14 Apr 2020 13:31:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t126sm10887477pfb.29.2020.04.14.13.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:31:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-4-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-4-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sdm845: Add interconnect properties for USB
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:31:41 -0700
Message-ID: <158689630151.105027.14207551281305119256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:44)
> Populate USB DT nodes with interconnect properties.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
