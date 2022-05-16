Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4D2E52850A
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 15:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiEPNMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 09:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiEPNMN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 09:12:13 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF4D1AF34
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652706731; x=1684242731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fyMN0ZFoo+4DV3z9PLvPDv/xCBpS3GUC6jjMqxiwucA=;
  b=hp8/gNo3V+q8+fsFXgAZLzHGy7+MXgRBhM2DcUX3vQx81OB0yhITebh5
   vLdtvLmQ4ndfGmoBXtoY7jKJjtuDecTjCqsAovA347j+mzfeAxTUPawUa
   XyACDfcOTEMnKB/EmuKYv3J/tv42ONrvdrYGn4aqWNf4zmT0kjvbHvYSI
   4qdpURnOSp79MFwg1cBqxoXZtmOB3qCMPaJjs6vsx99YlpdJd2tlDjKw8
   G4fOmrtQ73ZMh4fELCshco5Rv7eCDqwh9lJl6aNRaCb43ISXtn8O3ekRf
   IJVafspWAlkrVK9/1MwVS4HKwOgxdZFd2OlK+REk71GP0iidNcuZ9xXzS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="268403808"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="268403808"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 06:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="741236077"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 06:11:54 -0700
Date:   Mon, 16 May 2022 16:21:41 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <20220516132141.GE8368@ccdjLinux26>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
 <YoIMh0Di7QtALQ/Z@lahna>
 <20220516085903.GC8368@ccdjLinux26>
 <YoIajuneoVCCcfGZ@lahna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YoIajuneoVCCcfGZ@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, May 16, 2022 at 12:34:06PM +0300, Mika Westerberg wrote:
> On Mon, May 16, 2022 at 11:59:03AM +0300, Gil Fine wrote:
> > Hi Mika,
> > =

> > On Mon, May 16, 2022 at 11:34:15AM +0300, Mika Westerberg wrote:
> > > Hi Gil,
> > > =

> > > On Sun, May 15, 2022 at 11:27:46PM +0300, Gil Fine wrote:
> > > > > > +int tb_switch_tmu_config_enable(struct device *dev, void *data)
> > > > > =

> > > > > Also can we please make it take some real type and not something
> > > > > arbitrary?
> > > > You mean the names, right?
> > > > Something like:
> > > > int tb_switch_tmu_config_enable(struct device *parent, void *rate)
> > > > If so, yes, I will
> > > =

> > > I mean use a real type, not void *.
> > > =

> > > > > =

> > > > > Can it be const too?
> > > > IIUC, it shall be a function pointer with specified signature other=
wise it will fail
> > > > at compilation
> > > =

> > > Okay then I suggest to make a reasonable "API" function that handles
> > > all this internally that does not take arbitrary pointers. Remember to
> > > document it in kernel-doc too.
> > =

> > This is a function pointer that shall be passed to device_for_each_chil=
d()
> > And it has to be defined as:
> > =

> > int (*fn)(struct device *dev, void *data)
> > =

> > Similar as here e.g.:
> > =

> > static int remove_retimer(struct device *dev, void *data)
> > {
> > =BB=B7=B7=B7=B7=B7=B7=B7struct tb_retimer *rt =3D tb_to_retimer(dev);
> > =BB=B7=B7=B7=B7=B7=B7=B7struct tb_port *port =3D data;
> > =

> > =BB=B7=B7=B7=B7=B7=B7=B7if (rt && rt->port =3D=3D port)
> > =BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7tb_retimer_remove(rt);
> > =BB=B7=B7=B7=B7=B7=B7=B7return 0;
> > }
> > =

> > void tb_retimer_remove_all(struct tb_port *port)
> > {
> > =BB=B7=B7=B7=B7=B7=B7=B7struct usb4_port *usb4;
> > =

> > =BB=B7=B7=B7=B7=B7=B7=B7usb4 =3D port->usb4;
> > =BB=B7=B7=B7=B7=B7=B7=B7if (usb4)
> > =BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7device_for_each_child_r=
everse(&usb4->dev, port,
> > =BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=
=B7=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7      remove_retimer);
> > }
> > =

> > So not sure I get you...
> =

> The difference is that above it is static function not exposed outside
> of that file and used directly below its implementation.
> =

> In your case you make it non-static "API" function exported from tmu.c
> and called from tb.c.
> =

> So instead I suggest to put the device_for_each_child() in tmu.c and
> then the tb_switch_tmu_config_enable() static right above it. Please
> also name the resulting API function consistently.

OK, got you and fixed that.
Please let me know when you think that I can send out the v4 series.

-- =

Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

