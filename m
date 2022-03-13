Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27684D780F
	for <lists+linux-usb@lfdr.de>; Sun, 13 Mar 2022 21:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbiCMUBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Mar 2022 16:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiCMUBr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Mar 2022 16:01:47 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45514092C;
        Sun, 13 Mar 2022 13:00:37 -0700 (PDT)
Date:   Sun, 13 Mar 2022 21:00:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1647201635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ueY6o+hF+mZAyrqImdpbq5RfKpW71Ol7YUCawbDwUAo=;
        b=bmTgYNvOV9Ihb9ebKJ1qjN83mRbQf9JZIuXu64n1jGVZqTo3y8O8x5H4Xw2ZIVBKIzBlsW
        I83EajAFEnGtAVY6iIMJjjxBuFyNF70BY/w5kUPl7a+XHDCcMegMShcrjztNvgUsw4kPhy
        j9SefBzqBJRH4XQUD9QEmNHTKnsFIyI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Rob Herring <robh@kernel.org>
Cc:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: USB2512x boost value for up- and
 downstream ports
Message-ID: <Yi5NYJfyvYcC9X+j@ltleri2>
References: <PH0PR17MB48481AC6D6B808D2C106C4AA8E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
 <YithMVvcOKbq76OU@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YithMVvcOKbq76OU@robh.at.kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 08:48:17AM -0600, Rob Herring wrote:
> On Fri, Mar 11, 2022 at 12:09:42PM +0000, Neumann, Bastian wrote:
> > This patch adds devicetree documentation for signal boosting properties.
> > 
> > Signed-off-by: Bastian Neumann <bastian.neumann@dentsplysirona.com>
> > ---
> >  .../devicetree/bindings/usb/usb251xb.txt      | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> 
> A popular feature all the sudden. Which one are we supposed to apply? 
> This one or this[1]?

This seems to be a superset of the previous patchset from Tommaso.
Therefore I'd definitley vote for this one if a v2 of it [2] gets
merged (it was declined by GregKH because of the e-mail signature and
fomatting issues).

Until then I assume [1] should be applied as it represents the current
master state due to
commit 5c2b9c61ae5d (usb: usb251xb: add boost-up property support, 2022-01-28)
being already merged.

regards;rl

[2] https://lore.kernel.org/linux-usb/PH0PR17MB48482AD591AFD471637B16E28E0C9@PH0PR17MB4848.namprd17.prod.outlook.com/
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20220306184720.5350-1-tomm.merciai@gmail.com/
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > index 1a934eab175e..538ae49fc31d 100644
> > --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > @@ -68,6 +68,26 @@ Optional properties :
> >   - swap-dx-lanes : Specifies the ports which will swap the differential-pair
> >         (D+/D-), default is not-swapped.
> > 
> > +Electrical signal boosting
> > +The controller supplies a "boosting" functionality to drive up the USB
> > +electrical signals. This could result in non-USB compliant parameters
> > +(one example would be J/K level test). This should be <0x00> unless specific
> > +implementation issues requiew additional signal boosting to correct for deraded
> > +USB signaling levels:
> > + - <0x00> : Normal electrical drive strength (no boost)
> > + - <0x01> : Elevated drive strength low (~4% boost)
> > + - <0x02> : Elevated drive strength medium (~8% boost)
> > + - <0x03> : Elevated drive strength high (~12% boost)
> > +
> > + - boost-up : USB electrical signaling drive strength boost for upstream port.
> > + - boost-1 :  USB electrical signaling drive strength boost for port 1.
> > + - boost-2 :  USB electrical signaling drive strength boost for port 2.
> > + - boost-3 :  USB electrical signaling drive strength boost for port 3.
> > + - boost-4 :  USB electrical signaling drive strength boost for port 4.
> > + - boost-5 :  USB electrical signaling drive strength boost for port 5.
> > + - boost-6 :  USB electrical signaling drive strength boost for port 6.
> > + - boost-7 :  USB electrical signaling drive strength boost for port 7.
> > +
> >  Examples:
> >         usb2512b@2c {
> >                 compatible = "microchip,usb2512b";
> > @@ -86,4 +106,6 @@ Examples:
> >                 serial = "1234567890A";
> >                 /* correct misplaced usb connectors on port 1,2 */
> >                 swap-dx-lanes = <1 2>;
> > +               boost-up = <0x00>; /* no boost for upstream port */
> > +               boost-1 = <0x02>; /* medium boost on port 1 */
> >         };
> > --
> > 2.30.2
> > 
> > 
> > -----------------------------------------------------------------------------------------------------------
> > Sirona Dental Systems GmbH
> > Sitz der Gesellschaft / registered address: Fabrikstraße 31, 64625 Bensheim
> > Registergericht / court of registry: Amtsgericht Darmstadt, HRB 24948
> > Geschäftsführer / Managing Director: Dr. Cord Stähler, Jan Siefert, Rainer Raschke
> > Aufsichtsratsvorsitzender / Chairman of the Supervisory Board: Dr. Alexander Voelcker
> > 
> > -----------------------------------------------------------------------------------------------------------
> > 
> > 
> > Diese E-Mail ist ausschliesslich fuer den angesprochenen Adressaten
> > bestimmt und kann vertrauliche Informationen beinhalten.
> > --
> > This e-mail is intended only for the designated recipient(s). It may
> > contain confidential or proprietary information.
> > ------------------------------------------------------------------------------------------------------------
