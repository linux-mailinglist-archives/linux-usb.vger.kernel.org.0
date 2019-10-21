Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF344DE4DF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 08:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfJUGzx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 02:55:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:64066 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfJUGzx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 02:55:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Oct 2019 23:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,322,1566889200"; 
   d="scan'208";a="209381357"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 20 Oct 2019 23:55:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Oct 2019 09:55:49 +0300
Date:   Mon, 21 Oct 2019 09:55:49 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Add support for configuring DP
 altmode through device-properties
Message-ID: <20191021065549.GA28049@kuha.fi.intel.com>
References: <20191018195719.94634-1-hdegoede@redhat.com>
 <20191018195719.94634-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018195719.94634-2-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

On Fri, Oct 18, 2019 at 09:57:18PM +0200, Hans de Goede wrote:
> Add support for configuring display-port altmode through device-properties.
> 
> We could try to add a generic mechanism for describing altmodes in
> device-properties, but various altmodes will likely need altmode specific
> configuration. E.g. the display-port altmode needs some way to describe
> which set of DP pins on the GPU is connected to the USB Type-C connector.
> 
> As such it is better to have a separate set of altmode specific properties
> per altmode and this commit adds a property for basic display-port altmode
> support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../bindings/connector/usb-connector.txt      |  3 ++
>  drivers/usb/typec/tcpm/tcpm.c                 | 33 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> index d357987181ee..7bae3cc9c76a 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
> @@ -38,6 +38,9 @@ Optional properties for usb-c-connector:
>    or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
>  - data-role: should be one of "host", "device", "dual"(DRD) if typec
>    connector supports USB data.
> +- displayport-vdo: The presenence of this property indicates that the
> +  usb-connector supports displayport-altmode (svid 0xff01), the value of
> +  this property is an u32 with the vdo value for the displayport-altmode,

No, let's not take this approach.

Every alternate mode a connector supports will need to have its own
"sub-fwnode" under the connector fwnode. I thought we agreed this
earlier?

In any case, those sub-nodes will have default device properties named
"svid" and "vdo". If the alternate mode still needs some other
details, it can have other device properties that are specific to it,
but note that displayport alt mode does not need anything extra. The
"vdo" will already tells which pin configurations the connector
supports and that is all that the driver needs to know.

After we have the sub-nodes, it's not a big deal to walk through the
child-nodes the port has during port registration and register the
port alternate modes at the same time. That we can do in
typec_register_port(), so we do not need to do it in every driver
separately.


thanks,

-- 
heikki
