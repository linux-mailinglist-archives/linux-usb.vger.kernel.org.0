Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F046648D45
	for <lists+linux-usb@lfdr.de>; Sat, 10 Dec 2022 07:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiLJGGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Dec 2022 01:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiLJGGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Dec 2022 01:06:42 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1C1222BA
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 22:06:40 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fy4so6658060pjb.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Dec 2022 22:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bVk+uJflOw5qztjdh0z1VMobBn+gjNjuJ5tVCJIuo3M=;
        b=Ejx5CwKKEFgSQrwt8dqH2kVqLU1hopPZvAQhkz3nMsuiYTliMwpKyvk7iGn5T9nTnp
         M1IvchfWJtulJ9oBUPWPLsYK375Jm5o09un+Je4QdZmoBByGuRih3cWAhc6Px39Ws1Fw
         EM3Y1W5fe91kWOWGc3Dd6yFUZFvvMzOByHA0DXxjHY5Qm8Dlzt4/c4EJCy3rGxNsg0a4
         56NMK3keeYl3l5BUk1RaXg7kkHfVSOotqSdSt4+mlFT9gYv3r1EnMQplC5L1rYXKMo4L
         AyPXaJtnoB4ZMOj76lPTM42sgEhZH18juuf0KxXtb8ovoGrS7QTsrI1sTkbom5eeYH2J
         KGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVk+uJflOw5qztjdh0z1VMobBn+gjNjuJ5tVCJIuo3M=;
        b=rqP6RKAtIgfMt865WNs3Vdxq3B8eH4+2dfdAlWG2/vsF5+P3LMyXCjPbDUzChNTpE4
         VvvPrcabJTQBujzQJi4+vbDmgUSX0dN0iFykcc9C+SDqJmcxrYqH5e3xZTHZ6fG+LUF8
         3BXQjRQAvkSxuvMo/BofJCqP5VNCbRWDfjPDKxK0V5qp+aIlJzjoi42wAexr2uUoRofJ
         scafhBb9UZIPwAhSmRaPhHixTLwHjt6y0BHLpp3NEevff+k9XxqCAb2vXM7H+fVnmzRQ
         XlSAQe2zYZSUgIeW4R+3e3vjWF6woMh4AvV3ZhvzbJ2bObNSffA1vmPfNONHb74RQRJH
         nx9A==
X-Gm-Message-State: ANoB5pm3NbD8WdB/ekdf7MvYjfYcKYJzHI+mZMsquOk37e4BjKjbmKvL
        uFeJYTwmF073Vfhi9XE1OuRrvvtEXhLAeCsdn1lOaYC9LOFK5QZ9
X-Google-Smtp-Source: AA0mqf7QUhJ9tYxonNe2+119duuRWmdtJOE2xKXcpxY2+nqA2rSJ8jTzVJHSwCqo8oRZfyTsCxD57k/zY/3PEOIPryo=
X-Received: by 2002:a17:90a:df8f:b0:219:20ed:101e with SMTP id
 p15-20020a17090adf8f00b0021920ed101emr60627692pjv.215.1670652399553; Fri, 09
 Dec 2022 22:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20221208150456.473056-1-badhri@google.com> <819cb665-ec2f-5542-8ecf-e8ff7ca29908@roeck-us.net>
 <CAPTae5J-YOuifSRNJfsESs9YVJXt56BFMrx0f0GeEnK-zsotyQ@mail.gmail.com> <f05e66b9-1357-4d0d-7b9b-63ccf976a27c@roeck-us.net>
In-Reply-To: <f05e66b9-1357-4d0d-7b9b-63ccf976a27c@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Fri, 9 Dec 2022 22:06:02 -0800
Message-ID: <CAPTae5+vnCVd0K9kDPEqJds61i1tP6Z-R2Seiws7n+my3Ke1CQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] usb: typec: tcpm: Add callbacks to mitigate
 wakeups due to contaminant
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 path

On Fri, Dec 9, 2022 at 5:44 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/8/22 18:39, Badhri Jagan Sridharan wrote:
> > On Thu, Dec 8, 2022 at 3:56 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 12/8/22 07:04, Badhri Jagan Sridharan wrote:
> >>> On some of the TCPC implementations, when the Type-C port is exposed
> >>> to contaminants, such as water, TCPC stops toggling while reporting OPEN
> >>> either by the time TCPM reads CC pin status or during CC debounce
> >>> window. This causes TCPM to be stuck in TOGGLING state. If TCPM is made
> >>> to restart toggling, the behavior recurs causing redundant CPU wakeups
> >>> till the USB-C port is free of contaminant.
> >>>
> >>> [206199.287817] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> >>> [206199.640337] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> >>> [206199.985789] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> >>> ...
> >>>
> >>> TCPM invokes is_potential_contaminant callback to allow low level chip
> >>> drivers to monitor TCPM state machine transitions and notify TCPM when
> >>> the Type-C port needs to be checked for potential contaminant presence.
> >>> TCPCs which do have the needed hardware can implement the check_contaminant
> >>> callback which is invoked by TCPM to evaluate for presence of contaminant.
> >>> Lower level TCPC driver can restart toggling through TCPM_PORT_CLEAN event
> >>> when the driver detects that USB-C port is free of contaminant.
> >>>
> >>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >>> ---
> >>> Changes since v5:
> >>> * Updated commit message. Removed change id.
> >>> Changes since v4:
> >>> * None
> >>> Changes since v3:
> >>> * None
> >>> Changes since V2:
> >>> * Offloaded tcpm from maintaining disconnect_while_debouncing logic
> >>> * to lower level maxim tcpc driver based on feedback.
> >>> ---
> >>>    drivers/usb/typec/tcpm/tcpm.c | 162 +++++++++-------------------------
> >>>    include/linux/usb/tcpm.h      | 133 ++++++++++++++++++++++++++++
> >>>    2 files changed, 177 insertions(+), 118 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> >>> index 904c7b4ce2f0..a138cea49612 100644
> >>> --- a/drivers/usb/typec/tcpm/tcpm.c
> >>> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >>> @@ -33,119 +33,6 @@
> >>>
> >>>    #include <uapi/linux/sched/types.h>
> >>>
> >>> -#define FOREACH_STATE(S)                     \
> >>> -     S(INVALID_STATE),                       \
> >>> -     S(TOGGLING),                    \
> >>> -     S(SRC_UNATTACHED),                      \
> >>> -     S(SRC_ATTACH_WAIT),                     \
> >>> -     S(SRC_ATTACHED),                        \
> >>> -     S(SRC_STARTUP),                         \
> >>> -     S(SRC_SEND_CAPABILITIES),               \
> >>> -     S(SRC_SEND_CAPABILITIES_TIMEOUT),       \
> >>> -     S(SRC_NEGOTIATE_CAPABILITIES),          \
> >>> -     S(SRC_TRANSITION_SUPPLY),               \
> >>> -     S(SRC_READY),                           \
> >>> -     S(SRC_WAIT_NEW_CAPABILITIES),           \
> >>> -                                             \
> >>> -     S(SNK_UNATTACHED),                      \
> >>> -     S(SNK_ATTACH_WAIT),                     \
> >>> -     S(SNK_DEBOUNCED),                       \
> >>> -     S(SNK_ATTACHED),                        \
> >>> -     S(SNK_STARTUP),                         \
> >>> -     S(SNK_DISCOVERY),                       \
> >>> -     S(SNK_DISCOVERY_DEBOUNCE),              \
> >>> -     S(SNK_DISCOVERY_DEBOUNCE_DONE),         \
> >>> -     S(SNK_WAIT_CAPABILITIES),               \
> >>> -     S(SNK_NEGOTIATE_CAPABILITIES),          \
> >>> -     S(SNK_NEGOTIATE_PPS_CAPABILITIES),      \
> >>> -     S(SNK_TRANSITION_SINK),                 \
> >>> -     S(SNK_TRANSITION_SINK_VBUS),            \
> >>> -     S(SNK_READY),                           \
> >>> -                                             \
> >>> -     S(ACC_UNATTACHED),                      \
> >>> -     S(DEBUG_ACC_ATTACHED),                  \
> >>> -     S(AUDIO_ACC_ATTACHED),                  \
> >>> -     S(AUDIO_ACC_DEBOUNCE),                  \
> >>> -                                             \
> >>> -     S(HARD_RESET_SEND),                     \
> >>> -     S(HARD_RESET_START),                    \
> >>> -     S(SRC_HARD_RESET_VBUS_OFF),             \
> >>> -     S(SRC_HARD_RESET_VBUS_ON),              \
> >>> -     S(SNK_HARD_RESET_SINK_OFF),             \
> >>> -     S(SNK_HARD_RESET_WAIT_VBUS),            \
> >>> -     S(SNK_HARD_RESET_SINK_ON),              \
> >>> -                                             \
> >>> -     S(SOFT_RESET),                          \
> >>> -     S(SRC_SOFT_RESET_WAIT_SNK_TX),          \
> >>> -     S(SNK_SOFT_RESET),                      \
> >>> -     S(SOFT_RESET_SEND),                     \
> >>> -                                             \
> >>> -     S(DR_SWAP_ACCEPT),                      \
> >>> -     S(DR_SWAP_SEND),                        \
> >>> -     S(DR_SWAP_SEND_TIMEOUT),                \
> >>> -     S(DR_SWAP_CANCEL),                      \
> >>> -     S(DR_SWAP_CHANGE_DR),                   \
> >>> -                                             \
> >>> -     S(PR_SWAP_ACCEPT),                      \
> >>> -     S(PR_SWAP_SEND),                        \
> >>> -     S(PR_SWAP_SEND_TIMEOUT),                \
> >>> -     S(PR_SWAP_CANCEL),                      \
> >>> -     S(PR_SWAP_START),                       \
> >>> -     S(PR_SWAP_SRC_SNK_TRANSITION_OFF),      \
> >>> -     S(PR_SWAP_SRC_SNK_SOURCE_OFF),          \
> >>> -     S(PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED), \
> >>> -     S(PR_SWAP_SRC_SNK_SINK_ON),             \
> >>> -     S(PR_SWAP_SNK_SRC_SINK_OFF),            \
> >>> -     S(PR_SWAP_SNK_SRC_SOURCE_ON),           \
> >>> -     S(PR_SWAP_SNK_SRC_SOURCE_ON_VBUS_RAMPED_UP),    \
> >>> -                                             \
> >>> -     S(VCONN_SWAP_ACCEPT),                   \
> >>> -     S(VCONN_SWAP_SEND),                     \
> >>> -     S(VCONN_SWAP_SEND_TIMEOUT),             \
> >>> -     S(VCONN_SWAP_CANCEL),                   \
> >>> -     S(VCONN_SWAP_START),                    \
> >>> -     S(VCONN_SWAP_WAIT_FOR_VCONN),           \
> >>> -     S(VCONN_SWAP_TURN_ON_VCONN),            \
> >>> -     S(VCONN_SWAP_TURN_OFF_VCONN),           \
> >>> -                                             \
> >>> -     S(FR_SWAP_SEND),                        \
> >>> -     S(FR_SWAP_SEND_TIMEOUT),                \
> >>> -     S(FR_SWAP_SNK_SRC_TRANSITION_TO_OFF),                   \
> >>> -     S(FR_SWAP_SNK_SRC_NEW_SINK_READY),              \
> >>> -     S(FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED), \
> >>> -     S(FR_SWAP_CANCEL),                      \
> >>> -                                             \
> >>> -     S(SNK_TRY),                             \
> >>> -     S(SNK_TRY_WAIT),                        \
> >>> -     S(SNK_TRY_WAIT_DEBOUNCE),               \
> >>> -     S(SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS),    \
> >>> -     S(SRC_TRYWAIT),                         \
> >>> -     S(SRC_TRYWAIT_DEBOUNCE),                \
> >>> -     S(SRC_TRYWAIT_UNATTACHED),              \
> >>> -                                             \
> >>> -     S(SRC_TRY),                             \
> >>> -     S(SRC_TRY_WAIT),                        \
> >>> -     S(SRC_TRY_DEBOUNCE),                    \
> >>> -     S(SNK_TRYWAIT),                         \
> >>> -     S(SNK_TRYWAIT_DEBOUNCE),                \
> >>> -     S(SNK_TRYWAIT_VBUS),                    \
> >>> -     S(BIST_RX),                             \
> >>> -                                             \
> >>> -     S(GET_STATUS_SEND),                     \
> >>> -     S(GET_STATUS_SEND_TIMEOUT),             \
> >>> -     S(GET_PPS_STATUS_SEND),                 \
> >>> -     S(GET_PPS_STATUS_SEND_TIMEOUT),         \
> >>> -                                             \
> >>> -     S(GET_SINK_CAP),                        \
> >>> -     S(GET_SINK_CAP_TIMEOUT),                \
> >>> -                                             \
> >>> -     S(ERROR_RECOVERY),                      \
> >>> -     S(PORT_RESET),                          \
> >>> -     S(PORT_RESET_WAIT_OFF),                 \
> >>> -                                             \
> >>> -     S(AMS_START),                           \
> >>> -     S(CHUNK_NOT_SUPP)
> >>> -
> >>>    #define FOREACH_AMS(S)                              \
> >>>        S(NONE_AMS),                            \
> >>>        S(POWER_NEGOTIATION),                   \
> >>> @@ -182,13 +69,8 @@
> >>>        S(COUNTRY_INFO),                        \
> >>>        S(COUNTRY_CODES)
> >>>
> >>> -#define GENERATE_ENUM(e)     e
> >>>    #define GENERATE_STRING(s)  #s
> >>>
> >>> -enum tcpm_state {
> >>> -     FOREACH_STATE(GENERATE_ENUM)
> >>> -};
> >>> -
> >>>    static const char * const tcpm_states[] = {
> >>>        FOREACH_STATE(GENERATE_STRING)
> >>>    };
> >>> @@ -249,6 +131,7 @@ enum frs_typec_current {
> >>>    #define TCPM_RESET_EVENT    BIT(2)
> >>>    #define TCPM_FRS_EVENT              BIT(3)
> >>>    #define TCPM_SOURCING_VBUS  BIT(4)
> >>> +#define TCPM_PORT_CLEAN              BIT(5)
> >>>
> >>>    #define LOG_BUFFER_ENTRIES  1024
> >>>    #define LOG_BUFFER_ENTRY_SIZE       128
> >>> @@ -483,6 +366,14 @@ struct tcpm_port {
> >>>         * SNK_READY for non-pd link.
> >>>         */
> >>>        bool slow_charger_loop;
> >>> +
> >>> +     /*
> >>> +      * When true indicates that the lower level drivers indicate potential presence
> >>> +      * of contaminant in the connector pins based on the tcpm state machine
> >>> +      * transitions.
> >>> +      */
> >>> +     bool potential_contaminant;
> >>> +
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>        struct dentry *dentry;
> >>>        struct mutex logbuffer_lock;    /* log buffer access lock */
> >>> @@ -3904,15 +3795,26 @@ static void run_state_machine(struct tcpm_port *port)
> >>>        unsigned int msecs;
> >>>        enum tcpm_state upcoming_state;
> >>>
> >>> +     if (port->tcpc->is_potential_contaminant)
> >>> +             port->potential_contaminant =
> >>> +                     port->tcpc->is_potential_contaminant(port->tcpc, port->state);
> >>> +
> >>>        port->enter_state = port->state;
> >>>        switch (port->state) {
> >>>        case TOGGLING:
> >>>                break;
> >>> +     case CHECK_CONTAMINANT:
> >>> +             port->tcpc->check_contaminant(port->tcpc);
> >>> +             break;
> >>>        /* SRC states */
> >>>        case SRC_UNATTACHED:
> >>>                if (!port->non_pd_role_swap)
> >>>                        tcpm_swap_complete(port, -ENOTCONN);
> >>>                tcpm_src_detach(port);
> >>> +             if (port->potential_contaminant && port->tcpc->check_contaminant) {
> >>> +                     tcpm_set_state(port, CHECK_CONTAMINANT, 0);
> >>> +                     break;
> >>> +             }
> >>>                if (tcpm_start_toggling(port, tcpm_rp_cc(port))) {
> >>>                        tcpm_set_state(port, TOGGLING, 0);
> >>>                        break;
> >>> @@ -4150,6 +4052,10 @@ static void run_state_machine(struct tcpm_port *port)
> >>>                        tcpm_swap_complete(port, -ENOTCONN);
> >>>                tcpm_pps_complete(port, -ENOTCONN);
> >>>                tcpm_snk_detach(port);
> >>> +             if (port->potential_contaminant && port->tcpc->check_contaminant) {
> >>> +                     tcpm_set_state(port, CHECK_CONTAMINANT, 0);
> >>> +                     break;
> >>> +             }
> >>>                if (tcpm_start_toggling(port, TYPEC_CC_RD)) {
> >>>                        tcpm_set_state(port, TOGGLING, 0);
> >>>                        break;
> >>> @@ -4926,6 +4832,9 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
> >>>                else if (tcpm_port_is_sink(port))
> >>>                        tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >>>                break;
> >>> +     case CHECK_CONTAMINANT:
> >>> +             /* Wait for Toggling to be resumed */
> >>> +             break;
> >>>        case SRC_UNATTACHED:
> >>>        case ACC_UNATTACHED:
> >>>                if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> >>> @@ -5425,6 +5334,10 @@ static void tcpm_pd_event_handler(struct kthread_work *work)
> >>>                        port->vbus_source = true;
> >>>                        _tcpm_pd_vbus_on(port);
> >>>                }
> >>> +             if (events & TCPM_PORT_CLEAN) {
> >>> +                     tcpm_log(port, "port clean");
> >>> +                     tcpm_set_state(port, TOGGLING, 0);
> >>> +             }
> >>
> >> That sets the state to TOGGLING unconditionally, even if it not currently
> >> CHECK_CONTAMINANT. Is that a potential problem ?
> >
> > Good catch ! Would make sense to check whether tcpm is in
> > CHECK_CONTAMINANT state before setting the TOGGLING state.
> >>
> >>>
> >>>                spin_lock(&port->pd_event_lock);
> >>>        }
> >>> @@ -5477,6 +5390,19 @@ void tcpm_sourcing_vbus(struct tcpm_port *port)
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(tcpm_sourcing_vbus);
> >>>
> >>> +/*
> >>> + * Low level tcpc drivers invoke this once the port is deemed clean to return
> >>> + * the port to TOGGLING state.
> >>> + */
> >>> +void tcpm_port_clean(struct tcpm_port *port)
> >>> +{
> >>> +     spin_lock(&port->pd_event_lock);
> >>> +     port->pd_events |= TCPM_PORT_CLEAN;
> >>> +     spin_unlock(&port->pd_event_lock);
> >>> +     kthread_queue_work(port->wq, &port->event_work);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(tcpm_port_clean);
> >>> +
> >>>    static void tcpm_enable_frs_work(struct kthread_work *work)
> >>>    {
> >>>        struct tcpm_port *port = container_of(work, struct tcpm_port, enable_frs);
> >>> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> >>> index bffc8d3e14ad..9cf16372a6e4 100644
> >>> --- a/include/linux/usb/tcpm.h
> >>> +++ b/include/linux/usb/tcpm.h
> >>> @@ -10,6 +10,126 @@
> >>>    #include <linux/usb/typec.h>
> >>>    #include "pd.h"
> >>>
> >>> +#define FOREACH_STATE(S)                     \
> >>> +     S(INVALID_STATE),                       \
> >>> +     S(TOGGLING),                    \
> >>> +     S(CHECK_CONTAMINANT),                   \
> >>> +     S(SRC_UNATTACHED),                      \
> >>> +     S(SRC_ATTACH_WAIT),                     \
> >>> +     S(SRC_ATTACHED),                        \
> >>> +     S(SRC_STARTUP),                         \
> >>> +     S(SRC_SEND_CAPABILITIES),               \
> >>> +     S(SRC_SEND_CAPABILITIES_TIMEOUT),       \
> >>> +     S(SRC_NEGOTIATE_CAPABILITIES),          \
> >>> +     S(SRC_TRANSITION_SUPPLY),               \
> >>> +     S(SRC_READY),                           \
> >>> +     S(SRC_WAIT_NEW_CAPABILITIES),           \
> >>> +                                             \
> >>> +     S(SNK_UNATTACHED),                      \
> >>> +     S(SNK_ATTACH_WAIT),                     \
> >>> +     S(SNK_DEBOUNCED),                       \
> >>> +     S(SNK_ATTACHED),                        \
> >>> +     S(SNK_STARTUP),                         \
> >>> +     S(SNK_DISCOVERY),                       \
> >>> +     S(SNK_DISCOVERY_DEBOUNCE),              \
> >>> +     S(SNK_DISCOVERY_DEBOUNCE_DONE),         \
> >>> +     S(SNK_WAIT_CAPABILITIES),               \
> >>> +     S(SNK_NEGOTIATE_CAPABILITIES),          \
> >>> +     S(SNK_NEGOTIATE_PPS_CAPABILITIES),      \
> >>> +     S(SNK_TRANSITION_SINK),                 \
> >>> +     S(SNK_TRANSITION_SINK_VBUS),            \
> >>> +     S(SNK_READY),                           \
> >>> +                                             \
> >>> +     S(ACC_UNATTACHED),                      \
> >>> +     S(DEBUG_ACC_ATTACHED),                  \
> >>> +     S(AUDIO_ACC_ATTACHED),                  \
> >>> +     S(AUDIO_ACC_DEBOUNCE),                  \
> >>> +                                             \
> >>> +     S(HARD_RESET_SEND),                     \
> >>> +     S(HARD_RESET_START),                    \
> >>> +     S(SRC_HARD_RESET_VBUS_OFF),             \
> >>> +     S(SRC_HARD_RESET_VBUS_ON),              \
> >>> +     S(SNK_HARD_RESET_SINK_OFF),             \
> >>> +     S(SNK_HARD_RESET_WAIT_VBUS),            \
> >>> +     S(SNK_HARD_RESET_SINK_ON),              \
> >>> +                                             \
> >>> +     S(SOFT_RESET),                          \
> >>> +     S(SRC_SOFT_RESET_WAIT_SNK_TX),          \
> >>> +     S(SNK_SOFT_RESET),                      \
> >>> +     S(SOFT_RESET_SEND),                     \
> >>> +                                             \
> >>> +     S(DR_SWAP_ACCEPT),                      \
> >>> +     S(DR_SWAP_SEND),                        \
> >>> +     S(DR_SWAP_SEND_TIMEOUT),                \
> >>> +     S(DR_SWAP_CANCEL),                      \
> >>> +     S(DR_SWAP_CHANGE_DR),                   \
> >>> +                                             \
> >>> +     S(PR_SWAP_ACCEPT),                      \
> >>> +     S(PR_SWAP_SEND),                        \
> >>> +     S(PR_SWAP_SEND_TIMEOUT),                \
> >>> +     S(PR_SWAP_CANCEL),                      \
> >>> +     S(PR_SWAP_START),                       \
> >>> +     S(PR_SWAP_SRC_SNK_TRANSITION_OFF),      \
> >>> +     S(PR_SWAP_SRC_SNK_SOURCE_OFF),          \
> >>> +     S(PR_SWAP_SRC_SNK_SOURCE_OFF_CC_DEBOUNCED), \
> >>> +     S(PR_SWAP_SRC_SNK_SINK_ON),             \
> >>> +     S(PR_SWAP_SNK_SRC_SINK_OFF),            \
> >>> +     S(PR_SWAP_SNK_SRC_SOURCE_ON),           \
> >>> +     S(PR_SWAP_SNK_SRC_SOURCE_ON_VBUS_RAMPED_UP),    \
> >>> +                                             \
> >>> +     S(VCONN_SWAP_ACCEPT),                   \
> >>> +     S(VCONN_SWAP_SEND),                     \
> >>> +     S(VCONN_SWAP_SEND_TIMEOUT),             \
> >>> +     S(VCONN_SWAP_CANCEL),                   \
> >>> +     S(VCONN_SWAP_START),                    \
> >>> +     S(VCONN_SWAP_WAIT_FOR_VCONN),           \
> >>> +     S(VCONN_SWAP_TURN_ON_VCONN),            \
> >>> +     S(VCONN_SWAP_TURN_OFF_VCONN),           \
> >>> +                                             \
> >>> +     S(FR_SWAP_SEND),                        \
> >>> +     S(FR_SWAP_SEND_TIMEOUT),                \
> >>> +     S(FR_SWAP_SNK_SRC_TRANSITION_TO_OFF),                   \
> >>> +     S(FR_SWAP_SNK_SRC_NEW_SINK_READY),              \
> >>> +     S(FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED), \
> >>> +     S(FR_SWAP_CANCEL),                      \
> >>> +                                             \
> >>> +     S(SNK_TRY),                             \
> >>> +     S(SNK_TRY_WAIT),                        \
> >>> +     S(SNK_TRY_WAIT_DEBOUNCE),               \
> >>> +     S(SNK_TRY_WAIT_DEBOUNCE_CHECK_VBUS),    \
> >>> +     S(SRC_TRYWAIT),                         \
> >>> +     S(SRC_TRYWAIT_DEBOUNCE),                \
> >>> +     S(SRC_TRYWAIT_UNATTACHED),              \
> >>> +                                             \
> >>> +     S(SRC_TRY),                             \
> >>> +     S(SRC_TRY_WAIT),                        \
> >>> +     S(SRC_TRY_DEBOUNCE),                    \
> >>> +     S(SNK_TRYWAIT),                         \
> >>> +     S(SNK_TRYWAIT_DEBOUNCE),                \
> >>> +     S(SNK_TRYWAIT_VBUS),                    \
> >>> +     S(BIST_RX),                             \
> >>> +                                             \
> >>> +     S(GET_STATUS_SEND),                     \
> >>> +     S(GET_STATUS_SEND_TIMEOUT),             \
> >>> +     S(GET_PPS_STATUS_SEND),                 \
> >>> +     S(GET_PPS_STATUS_SEND_TIMEOUT),         \
> >>> +                                             \
> >>> +     S(GET_SINK_CAP),                        \
> >>> +     S(GET_SINK_CAP_TIMEOUT),                \
> >>> +                                             \
> >>> +     S(ERROR_RECOVERY),                      \
> >>> +     S(PORT_RESET),                          \
> >>> +     S(PORT_RESET_WAIT_OFF),                 \
> >>> +                                             \
> >>> +     S(AMS_START),                           \
> >>> +     S(CHUNK_NOT_SUPP)
> >>> +
> >>> +#define GENERATE_ENUM(e)     e
> >>> +
> >>> +enum tcpm_state {
> >>> +     FOREACH_STATE(GENERATE_ENUM)
> >>> +};
> >>> +
> >>
> >> Sorry for not bringing it up earlier; I have been struggling with it all along,
> >> and I could not decide if I should bring it up or not.
> >>
> >> I really don't feel comfortable with exporting states outside tcpm.
> >> Is this really necessary ? The only use seems to be
> >>
> >> +       if ((tcpm_prev_state == SRC_ATTACH_WAIT && current_state == SRC_UNATTACHED) ||
> >> +           (tcpm_prev_state == SNK_ATTACH_WAIT && current_state == SNK_UNATTACHED))
> >>
> >> Plus, of course, the CHECK_CONTAMINANT state.
> >>
> >> Is there reason to believe that the relevant state transitions would be different
> >> for other chips ? If not, would it possibly make sense to move this check
> >> into the state machine ?
> >
> > In my understanding, this is definitely one of the transitions that I
> > think will happen when the port has contaminant. It's quite possible
> > that there are transitions that I am not aware of yet.
> > I am OK moving it back to the tcpm state machine, however, then tcpm
> > would have to keep track of the tcpm state machine transitions and
> > that would look like V2 version of the patch
> > (https://lore.kernel.org/lkml/20220831001555.285081-1-badhri@google.com/)
> > where disconnect_while_debouncing is used to track this. Would that be
> > OK ?
> >
>
> Kind of, except that I think it was way too invasive. The current code checks for
> contaminant once when entering the state machine. If you pull that code into the
> state machine, I don't see why it would have to be more than a single call.
> One possibility might be to move the call into tcpm_set_state() to catch all
> state transitions, or to use the existing enter_state variable for that
> purpose.

enter_state suited better ! tcpm_set_state's delayed state was making
it tricky..
So chose the enter_state path and have updated series (Version 8).
I also added a small helper function to check whether the state machine
is in toggling state.

>
> >>
> >>>    enum typec_cc_status {
> >>>        TYPEC_CC_OPEN,
> >>>        TYPEC_CC_RA,
> >>> @@ -114,6 +234,16 @@ enum tcpm_transmit_type {
> >>>     *              Optional; The USB Communications Capable bit indicates if port
> >>>     *              partner is capable of communication over the USB data lines
> >>>     *              (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
> >>> + * @check_contaminant:
> >>> + *           Optional; The callback is invoked when chiplevel drivers indicated
> >>> + *           that the USB port needs to be checked for contaminant presence.
> >>> + *           Chip level drivers are expected to check for contaminant and call
> >>> + *           tcpm_clean_port when the port is clean to put the port back into
> >>> + *           toggling state.
> >>> + * @is_potential_contaminant:
> >>> + *           Optional; TCPM invokes the callback for every TCPM state machine
> >>> + *           transition. Chiplevel drivers can monitor the state machine
> >>> + *           transitions to flag for potential contaminant presence.
> >>
> >> I kind of dislike the repeated checks for those callbacks in the state machine.
> >> Does it make any sense to have one of those callbacks but not the other ?
> >>
> >> Because if not it might make sense to check in the registration function
> >> if either both are NULL or both are set, and then drop most of the checks
> >> in the state machine handler.
> >
> > I can definitely check for the registration of the callbacks but cant
> > drop one of them unless we are OK to make tcpm transitions and invoke
> > the check_contaminant callback directly.
> >
>
> I didn't necessarily mean to drop one of the callbacks (unless one of them is
> pulled into the tcpm driver). I envisioned a check such as
>         if ((!tcpc->check_contaminant && tcpc->is_potential_contaminant) ||
>             ((tcpc->check_contaminant && !tcpc->is_potential_contaminant))
>                 return ERR_PTR(-EINVAL);
> in tcpm_register_port().
>
> With that, it would no longer be necessary to keep checking for
> port->tcpc->check_contaminant later on because potential_contaminant would only
> ever be true if the check_contaminant callback exists.

We now only have check_contaminant callback in v8 :)

>
> Another note: We currently don't log in SRC_UNATTACHED, SNK_UNATTACHED,
> and TOGGLING states. Would it make sense to add CHECK_CONTAMINANT to
> the checks in tcpm_log() ?

Sure, made the change in v8.

Thanks,
Badhri

>
> Thanks,
> Guenter
>
> > Thanks,
> > Badhri
> >
> >
> >>
> >> Thanks,
> >> Guenter
> >>
> >>>     */
> >>>    struct tcpc_dev {
> >>>        struct fwnode_handle *fwnode;
> >>> @@ -148,6 +278,8 @@ struct tcpc_dev {
> >>>                                                 bool pps_active, u32 requested_vbus_voltage);
> >>>        bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
> >>>        void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
> >>> +     void (*check_contaminant)(struct tcpc_dev *dev);
> >>> +     bool (*is_potential_contaminant)(struct tcpc_dev *dev, enum tcpm_state current_state);
> >>>    };
> >>>
> >>>    struct tcpm_port;
> >>> @@ -165,5 +297,6 @@ void tcpm_pd_transmit_complete(struct tcpm_port *port,
> >>>                               enum tcpm_transmit_status status);
> >>>    void tcpm_pd_hard_reset(struct tcpm_port *port);
> >>>    void tcpm_tcpc_reset(struct tcpm_port *port);
> >>> +void tcpm_port_clean(struct tcpm_port *port);
> >>>
> >>>    #endif /* __LINUX_USB_TCPM_H */
> >>>
> >>> base-commit: 1524ceb14dd5ebd6f724d993c5ec1a9a8d445d8e
> >>
>
