Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CF336D6E9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhD1MCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 08:02:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44618 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhD1MCC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 08:02:02 -0400
Received: from [IPv6:2a02:810a:880:f54:fc4d:ab2d:afcb:a61c] (unknown [IPv6:2a02:810a:880:f54:fc4d:ab2d:afcb:a61c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACE881F41DBB;
        Wed, 28 Apr 2021 13:01:15 +0100 (BST)
Subject: Re: [PATCH v6 0/2] Add support for ANX7688
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     megous@megous.com, linux-usb@vger.kernel.org, a.hajda@samsung.com,
        narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie,
        daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
        enric.balletbo@collabora.com, drinkcat@chromium.org,
        hsinyi@chromium.org, kernel@collabora.com, dafna3@gmail.com,
        robh+dt@kernel.org
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <503fc44c-10e4-d4f4-a746-3fe3e6066b80@collabora.com>
Date:   Wed, 28 Apr 2021 14:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, pinging here, can one of the kernel bridge maintainers review this patchset?

Thanks,
Dafna

On 09.04.21 18:19, Dafna Hirschfeld wrote:
> ANX7688 is a typec port controller that also converts HDMI to DP.
> ANX7688 is found on Acer Chromebook R13 (elm) and on Pine64 PinePhone.
> 
> On Acer Chromebook R13 (elm), the device is powered-up and controller by the
> Embedded Controller. Therefore its operation is transparent
> to the SoC. It is used in elm only as a display bridge driver.
> The bridge driver only reads some values using i2c and use them to
> implement the mode_fixup cb.
> 
> On v5 we added the full dt-binding of the generic Analogix anx7688 device.
> The problem is that for elm, most of the fields are not needed since
> the anx7688 sits behind the EC. After a discussion on v5 (see [1])
> we decided to go back to the original approach and send the dt binding
> as specific to the elm. So in this version we rename the device to cros_ec_anx7688
> and use the compatible 'google,cros-ec-anx7688'.
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210305124351.15079-3-dafna.hirschfeld@collabora.com/
> 
> Changes since v5:
> * treat the device as a specific combination of an ANX7688 behind the EC and
> call it 'cros-ec-anx7688'
> 
> Changes since v4:
> In v4 of this set, the device was added as an 'mfd' device
> and an additional 'bridge' device for the HDMI-DP conversion, see [2].
> 
> [2] https://lkml.org/lkml/2020/3/18/64
> 
> Dafna Hirschfeld (1):
>    dt-bindings: display: add google,cros-ec-anx7688.yaml
> 
> Enric Balletbo i Serra (1):
>    drm/bridge: Add ChromeOS EC ANX7688 bridge driver support
> 
>   .../bridge/google,cros-ec-anx7688.yaml        |  82 ++++++++
>   drivers/gpu/drm/bridge/Kconfig                |  12 ++
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   drivers/gpu/drm/bridge/cros-ec-anx7688.c      | 191 ++++++++++++++++++
>   4 files changed, 286 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
>   create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c
> 
